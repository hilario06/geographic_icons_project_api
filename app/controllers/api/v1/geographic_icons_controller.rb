module Api
  module V1
    class GeographicIconsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_geographic_icon, only: %i[update destroy show]

      def index
        @geographic_icons = GeographicIcon.all
        render :index, status: :ok
      end

      def show; end

      def create
        @geographic_icon = GeographicIcon.new(geographic_icon_params)
        if @geographic_icon.valid?
          @geographic_icon.save
          render :show, status: :created
        else
          render json: { errors: @geographic_icon.errors.messages }, status: :bad_request
        end
      end

      def update
        if @geographic_icon.update(geographic_icon_params)
          render :show, status: :ok
        else
          render json: { errors: @geographic_icon.errors.messages }, status: :bad_request
        end
      end

      def destroy
        @geographic_icon.destroy
        head :ok
      end

      def restore
        @geographic_icon = GeographicIcon.only_deleted.find(params[:geographic_icon_id])
        head :not_found unless @geographic_icon
        GeographicIcon.restore @geographic_icon.id
        render :show, status: :ok
      end

      private

      def geographic_icon_params
        params.require(:geographic_icon).permit(:denomination, :date_of_creation, :height, :history, :city_id)
      end

      def set_geographic_icon
        @geographic_icon = GeographicIcon.find(params[:id])
        head :not_found unless @geographic_icon
      end
    end
  end
end
