class Api::V1::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city, only: %i[update destroy show]

  def index
    if params[:query].present?
      # busqueda con pg_search
      @cities = City.contry_search(params[:query])
    else
      @cities = City.all
    end
    render :index, status: :ok
  end

  def show; end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      Country.find(@city.country_id).update_sum_number_of_inhabitants!(@city.number_of_inhabitants)
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

  def restore
    @city = City.only_deleted.find(params[:city_id])
    head :not_found unless @city
    @city.restore
    render :show, status: :ok
  end

  private

  def city_params
    params.require(:city).permit(:denomination, :number_of_inhabitants, :totat_surface_area, :country_id, :image)
  end

  def set_city
    @city = City.find(params[:id])
    head :not_found unless @city
  end
end
