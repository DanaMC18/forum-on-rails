class SessionsController < ApplicationController

  # get 'login'
  def new
    @user = User.new
  end

  # post 'login'
  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password] )
    @topics = Topic.all
    if @user
      redirect_to topics
    else
      @incorrect_info = "Your username or password does not match our records, please try again."
      render :new
    end
  end

  # 'logout'
  def destroy
    session[:current_user_id] = nil
    redirect_to topics
  end

end