require "redcarpet"

class TopicsController < ApplicationController
  
  def index
    @user = User.find(session[:current_user_id]) if session[:current_user_id]
    @topics = Topic.all
  end


  def show
    @topic = Topic.find(params[:id])
    @comments = Comment.all.where(topic_id: params[:id])
    @user = User.find(session[:current_user_id]) if session[:current_user_id]
    if @comments.length <= 1
      @comment = @comments.first
    end
  end


  def new
    if session[:current_user_id]
      @topic = Topic.new
    else 
      redirect_to topics
    end
  end


  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topic
    else
      render :new
    end
  end


  def edit
    @topic = Topic.find(params[:id])
    if session[:current_user_id] != @topic.user_id
      redirect_to topics
    end
  end


  def update
    topic = Topic.find(params[:id])
    topic.update(topic_params)
    redirect_to topic
  end


  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics
  end
  

  private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

end





