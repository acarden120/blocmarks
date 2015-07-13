class TopicsController < ApplicationController
  include Pundit

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = current_user.topics.build(topics_params)
    @topic.user = @user

    if @topic.save
      flash[:notice] = 'Topic was created.'
      redirect_to topics_path(current_user)
    else
      flash[:error] = 'There was an error saving the topic. Please try again.'
    end
  end

  def destroy
    @topic = Topic.friendly.find(params[:id])

    if @topic.destroy
      flash[:notice] = 'Topic was deleted.'
      redirect_to topics_path(current_user)
    else
      flash[:error] = 'There was an error deleting the topic. Please try again.'
    end
  end

  private

  def topics_params
    params.require(:topic).permit(:title)
  end
end
