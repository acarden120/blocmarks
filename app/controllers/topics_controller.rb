class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def show
  	@topics = Topic.all
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
      redirect_to @user
    else
      flash[:error] = 'There was an error saving the topic. Please try again.'
    end

  end

  def edit
  end

  private

  def topics_params
    params.require(:topic).permit(:title)
  end
end
