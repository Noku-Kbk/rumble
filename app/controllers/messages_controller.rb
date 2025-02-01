class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    @message.room = @room
    @message.user = current_user

    if @message.save
      redirect_to room_path(@room), notice: "Message sent!"
    else
      redirect_to room_path(@room), alert: "Message failed to send."
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
