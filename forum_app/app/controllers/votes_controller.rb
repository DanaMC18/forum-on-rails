class VotesController < ApplicationController

  def create
    user_id = session[:user_id] if session[:user_id]
    topic_id = params[:id]
    Vote.create(user_id: user_id, topic_id: topic_id)
    redirect to topics
  end

end