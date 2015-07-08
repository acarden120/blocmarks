class LikesController < ApplicationController
  include Pundit

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = 'Bookmark was liked.'
      redirect_to topics_path(current_user)
    else
      flash[:error] = 'There was an error saving the like. Please try again.'
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])
    if like.destroy
      redirect_to topics_path(current_user)
    else
      flash[:error] = 'There was an error liking the bookmark. Please try again.'
    end
  end
end
