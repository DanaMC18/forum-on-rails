class UsersController < ApplicationController

  def index
    if session[:user_id]
      @users = User.all 
    else
      redirect_to topics_path
    end
  end


  def show
    @user = User.find(params[:id])
    if !session[:user_id]
      redirect_to topics_path
    end
  end


  def new
    @user = User.new
  end
  

  def create
    user = User.new(user_params)
    @topics = Topic.all
    if user.save
      redirect_to topics_path
    elsif params[:password] != params[:password_confirmation]
      @password_message = "Sorry #{params[:name]}, your passwords did not match. Please try again."
      redirect_to topics_path
    else
      @username_message = "Sorry #{params[:name]}, #{params[:username]} is already a username."
      redirect_to topics_path
    end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil
    redirect_to topics_path
  end


  private
    def user_params
      params.require(:user).permit(:name, :username, :password_digest, :profile_pic)
    end

end