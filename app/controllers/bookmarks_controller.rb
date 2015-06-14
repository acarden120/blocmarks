class BookmarksController < ApplicationController
  def show
  end

  def new
  	@bookmark = Bookmark.new
  end

  def create
    @user = current_user
    @topic = @user.topics.find(params[:topic_id])
    @url = bookmark_params[:url]
    bookmark = @topic.bookmarks.build(topic: @topic, url: @url)

    if bookmark.save
      redirect_to topics_path(current_user)
    else
      flash[:error] = 'There was an error saving the bookmark. Please try again.'
    end    
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
