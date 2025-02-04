class RoomsController < ApplicationController
  def show
    @room = Room.first
    @message = Message.new
  end
end
