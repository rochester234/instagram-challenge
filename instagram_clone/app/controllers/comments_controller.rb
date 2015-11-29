class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comments.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)

    redirect_to pictures_path
  end

  def comment_params
    params.require(:comments).permit(:comments)
  end
end
