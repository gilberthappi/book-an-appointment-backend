require 'swagger_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
  path '/api/v1/users/{user_id}/reservations' do
    # Your existing code for GET and POST requests here...
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'Reservation ID'

    # Updated to use let! to ensure the reservation is created before each test
    let!(:reservation) { create(:reservation) } # Assuming you have a factory named :reservation set up with FactoryBot

    get('Retrieve a specific reservation for a user') do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 customer_id: { type: :integer },
                 place_id: { type: :integer },
                 start_date: { type: :string, format: :date },
                 end_date: { type: :string, format: :date },
                 bill: { type: :number }
               },
               required: %i[id customer_id place_id start_date end_date]

        run_test!
      end
    end

    delete('Delete a reservation for a user') do
      tags 'Reservations'

      # Using before block to ensure reservation is created before each delete test
      before do
        reservation # Ensure reservation is created
      end

      it "returns a 200 response" do
        delete "/api/v1/reservations/#{reservation.id}"
        expect(response).to have_http_status(200)
      end
    end
  end
end
