require "redcarpet"

class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to topic
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to topic
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end