class PotholesController < ApplicationController
  def index
    @potholes = Pothole.all
    @markers = @potholes.geocoded.map do |pothole|
      {
        lat: pothole.latitude,
        lng: pothole.longitude,
        info_window_html: render_to_string(partial: "pages/info_window", locals: {pothole: pothole})
      }
    end
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

  def update
    @pothole = Pothole.find(params[:id])
    if @pothole.update(pothole_params)
      redirect_to @pothole, notice: 'Pothole was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @pothole = Pothole.find(params[:id])
  end

  def destroy
    @pothole = Pothole.find(params[:id])
    @pothole.destroy
    redirect_to potholes_path, status: :see_other
  end

  private

  def pothole_params
    params.require(:pothole).permit(:address, :size, :description, :status, :user_id, :photo)
  end

end
