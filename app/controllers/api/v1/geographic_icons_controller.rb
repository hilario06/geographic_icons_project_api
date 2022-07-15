module Api
  module V1
    class GeographicIconsController < ApplicationController
      before_action :authenticate_user!

      def create
        @geographic_icon = GeographicIcon.new(geographic_icon_params)
        if @geographic_icon.valid?
          @geographic_icon.save
          p @geographic_icon
          render :show, status: :created
        else
          render json: { errors: @geographic_icon.errors.messages }, status: :bad_request
        end
      end

      private
      def geographic_icon_params
        params.require(:geographic_icon).permit(:denomination, :date_of_creation, :height, :history, :city_id)
      end
    end
  end
end
