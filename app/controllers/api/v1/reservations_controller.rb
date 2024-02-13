module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_api_v1_reservation, only: %i[show update destroy]

      # GET /api/v1/reservations
      def index
        user = User.find_by(id: params[:user_id])
        @api_v1_reservations = user.reservations

        render json: @api_v1_reservations
      end

      # GET /api/v1/reservations/1
      def show
        render json: @api_v1_reservation
      end

      # POST /api/v1/reservations
      def create
        @api_v1_reservation = Reservation.new(api_v1_reservation_params)

        if @api_v1_reservation.save
          render json: @api_v1_reservation, status: :created, location: api_v1_reservation_url(@api_v1_reservation)
        else
          render json: @api_v1_reservation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/reservations/1
      def update
        if @api_v1_reservation.update(api_v1_reservation_params)
          render json: @api_v1_reservation
        else
          render json: @api_v1_reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/reservations/1
      def destroy
        @api_v1_reservation.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_reservation
        @api_v1_reservation = Reservation.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def api_v1_reservation_params
        params.require(:reservation).permit(:customer_id, :place_id, :start_date, :end_date, :bill)
      end
    end
  end
end
