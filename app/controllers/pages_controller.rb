class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @potholes = Pothole.all
    @markers = @potholes.geocoded.map do |pothole|
      {
        lat: pothole.latitude,
        lng: pothole.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pothole: pothole})
      }
    end
  end
end
