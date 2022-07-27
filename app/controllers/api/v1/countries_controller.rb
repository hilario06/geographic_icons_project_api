class Api::V1::CountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:query].present?
      @countries = Country.contry_search(params[:query])
    else
      @countries = Country.all
    end
    render :index, status: :ok
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def restore
  end
end
