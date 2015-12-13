class SessionsController < ApplicationController
  layout :layout

  # get 'login'
  def new
  end

  # post 'login'
  def create
    user = User.find_by(username: params[:username])
    @topics = Topic.all
    if user && user.authenticate(params[:session][:password])
      redirect_to topics
    else
      @incorrect_info = "Your username or password does not match our records, please try again."
      render :new
    end
  end

  # 'logout'
  def destroy
    session[:user_id] = nil
    redirect_to topics
  end

end