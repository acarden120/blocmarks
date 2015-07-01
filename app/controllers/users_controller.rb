class UsersController < ApplicationController
  include Pundit

  def show
  	user = current_user
  	@bookmarks = Bookmark.all
  	@user_bookmarks = user.topics.all
	@liked_bookmarks = user.bookmarks.all
  end
end
