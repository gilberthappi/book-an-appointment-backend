require 'rails_helper'
require 'factory_bot_rails'
require_relative '../factories/place'

RSpec.describe "Users API", type: :request do
  describe "POST /api/v1/users/:user_id/reservations" do
    let(:user) { create(:user) } # Assuming you have a factory named :user set up with FactoryBot

    it "creates a new reservation for the user" do
      # You may need to adjust the request parameters according to your application's requirements
      post "/api/v1/users/#{user.id}/reservations", params: { reservation: { attribute1: value1, attribute2: value2 } }

      expect(response).to have_http_status(200)
      expect(user.reservations.count).to eq(1)
    end
  end
end
