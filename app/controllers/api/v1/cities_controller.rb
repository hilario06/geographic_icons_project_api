class Api::V1::CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
    render :index, status: :ok
  end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      render :show, status: :created
    else
      render json: { errors: @city.errors.messages }, status: :bad_request
    end
  end

  private

  def city_params
    params.require(:city).permit(:denomination, :number_of_inhabitants, :totat_surface_area, :country_id)
  end
end
