class Api::V1::CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country, only: %i[update destroy show]

  def index
    if params[:query].present?
      @countries = Country.contry_search(params[:query])
    else
      @countries = Country.all
    end
    render :index, status: :ok
  end

  def show; end

  def create
    @country = Country.new(country_params)
    if @country.valid?
      @country.save
      render :show, status: :created
    else
      render json: { errors: @country.errors.messages }, status: :bad_request
    end
  end

  def update
    if @country.update(country_params)
      render :show, status: :ok
    else
      render json: { errors: @country.errors.messages }, status: :bad_request
    end
  end

  def destroy
    @country.destroy
    head :ok
  end

  def restore
    @country = Country.only_deleted.find(params[:country_id])
    head :not_found unless @country
    @country.restore
    render :show, status: :ok
  end

  private

  def country_params
    params.require(:country).permit(:denomination, :number_of_inhabitants, :totat_surface_area, :continent_id)
  end

  def set_country
    @country = Country.find(params[:id])
    head :not_found unless @country
  end
end
