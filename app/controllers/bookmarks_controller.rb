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

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = 'Bookmark was deleted.'
      redirect_to topics_path(current_user)
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

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      redirect_to topics_path, notice: "Bookmark was updated"
    else
      flash[:error] = "There was an error updating the bookmark. Please try again."
      render :edit
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
