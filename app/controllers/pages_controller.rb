class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @potholes = Pothole.all
    @markers = @potholes.geocoded.map do |pothole|
      {
        lat: pothole.latitude,
        lng: pothole.longitude
      }
    end
  end
end
