class Api::V1::CountriesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      # busqueda con pg_search
      @cities = Country.global_search(params[:query])
    else
      @cities = Country.all
    end
    render :index, status: :ok
  end
end
