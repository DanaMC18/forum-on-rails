class SessionsController < ApplicationController

  # get 'login'
  def new
  end

  # post 'login'
  def create
    # user = User.find_by(username: params[:session][:username])
    user = User.find_by_username(params[:username])
    @topics = Topic.all
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/topics"
    else
      @incorrect_info = "Your username or password does not match our records, please try again."
      render :new
    end
  end

  # 'logout'
  def destroy
    @current_user[:user_id] = nil
    redirect_to topics
  end

end