class LikesController < ApplicationController
  include Pundit

  before_action :authenticate_user!, only: [:create]

  def new
    @like = Like.new
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = 'Bookmark was liked.'
      redirect_to topics_path(current_user)
    else
      flash[:error] = "There was an error saving the Favorite. Please try again."
      # Add code to generate a failure flash and redirect to @bookmark
    end
  end

  def destroy
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params

    if like.destroy
      # Flash success and redirect to @bookmark
    else
      # Flash error and redirect to @bookmark
    end
  end
end