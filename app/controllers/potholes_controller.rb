class PotholesController < ApplicationController
  def index
    @potholes = Pothole.all
  end

  def show
    @pothole = Pothole.find(params[:id])
  end
end
