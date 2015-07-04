class UsersController < ApplicationController
  include Pundit

  def show
    user = current_user
    @user_bookmarks = user.topics.all
    @liked_bookmarks = user.likes
  end
end
