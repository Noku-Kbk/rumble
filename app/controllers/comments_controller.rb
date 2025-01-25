class CommentsController < ApplicationController
  before_action :set_pothole, only: [:index, :create, :destroy]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @pothole.comments
  end

  def create
    @comment = @pothole.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @pothole, notice: 'Comment was successfully added.'
    else
      redirect_to @pothole, alert: 'Failed to add comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @pothole, notice: 'Comment was successfully deleted.', status: :see_other
  end

  private

  def set_pothole
    @pothole = Pothole.find(params[:pothole_id])
  end

  def set_comment
    @comment = @pothole.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
