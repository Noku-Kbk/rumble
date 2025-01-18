class PotholesController < ApplicationController
  def index
    @potholes = Pothole.all
  end
end

