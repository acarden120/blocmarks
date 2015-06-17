class BookmarksController < ApplicationController
  include Pundit

  before_action :authenticate_user! # , only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @url = bookmark_params[:url]
    bookmark = @topic.bookmarks.build(topic: @topic, url: @url)
    authorize bookmark

    bookmark.save
    redirect_to topics_path(current_user)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
 
    if @bookmark.destroy
      redirect_to topics_path(current_user), notice: 'Bookmark was deleted'
    else
      flash[:error] = 'There was an error deleting the topic. Please try again.'
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark

    @bookmark.update_attributes(bookmark_params)
    redirect_to topics_path, notice: 'Bookmark was updated'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
