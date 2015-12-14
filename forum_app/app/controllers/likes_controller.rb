class LikesController < ApplicationController

  def create
    user_id = @current_user[:user_id]
    comment_id = params[:id]
    Like.create(user_id: user_id, comment_id: comment_id)
    redirect_to topic
  end

end