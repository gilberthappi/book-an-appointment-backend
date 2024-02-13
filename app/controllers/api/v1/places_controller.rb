module Api
  module V1
    class PlacesController < ApplicationController
      before_action :set_api_v1_place, only: %i[show update destroy]

      # GET /api/v1/places
      def index
        @api_v1_places = Place.all

        render json: @api_v1_places
      end

      # GET /api/v1/places/1
      def show
        render json: @api_v1_place
      end

      # POST /api/v1/places
      def create
        @api_v1_place = Place.new(api_v1_place_params)

        if @api_v1_place.save
          render json: @api_v1_place, status: :created, location: api_v1_place_url(@api_v1_place)
        else
          render json: @api_v1_place.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/places/1
      def update
        if @api_v1_place.update(api_v1_place_params)
          render json: @api_v1_place
        else
          render json: @api_v1_place.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/places/1
      def destroy
        @api_v1_place.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_place
        @api_v1_place = Place.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def api_v1_place_params
        params.require(:place).permit(:owner_id, :description, :location, :rate, :photo)
      end
    end
  end
end
