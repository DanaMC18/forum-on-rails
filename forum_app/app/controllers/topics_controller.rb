class TopicController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

end