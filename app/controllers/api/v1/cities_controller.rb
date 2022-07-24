class Api::V1::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city, only: %i[update destroy]

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

  def update
    if @city.update(city_params)
      render :show, status: :ok
    else
      render json: { errors: @city.errors.messages }, status: :bad_request
    end
  end

  def destroy
    @city.destroy
    head :ok
  end

  private

  def city_params
    params.require(:city).permit(:denomination, :number_of_inhabitants, :totat_surface_area, :country_id)
  end

  def set_city
    @city = City.find(params[:id])
    head :not_found unless @city
  end
end
