class UsersController < ApplicationController
  include Pundit

  def show
  	user = current_user
  	bookmarks = Bookmark.all
  	@user_bookmarks = user.bookmarks.all
  	@liked_bookmarks = user.bookmarks.where()
  end
end
