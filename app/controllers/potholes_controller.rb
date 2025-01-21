class PotholesController < ApplicationController
  def index
    @potholes = Pothole.all
  end

  def show
    @pothole = Pothole.find(params[:id])
  end
  
  def new
    @pothole = Pothole.new
  end

  def create
    @pothole = Pothole.new(pothole_params)
    @pothole.user = current_user
    if @pothole.save
      redirect_to @pothole, notice: 'Pothole was successfully reported.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pothole_params
    params.require(:pothole).permit(:address, :size, :description, :status, :user_id)
  end
end
