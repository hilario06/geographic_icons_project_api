class Api::V1::CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
    render :index, status: :ok
  end
end
