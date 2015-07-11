class UsersController < ApplicationController
  include Pundit
  require 'embedly'
  require 'json'

  def show
    user = current_user
    @user_bookmarks = user.topics.all
    @liked_bookmarks = user.likes
  end

  def get_preview(url)
    embedly_api =
    Embedly::API.new :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    # single url
#    obj = embedly_api.oembed :url => 'http://www.youtube.com/watch?v=sPbJ4Z5D-n4&feature=topvideos'
    obj = embedly_api.oembed :url => 'http://www.youtube.com/watch?v=sPbJ4Z5D-n4&feature=topvideos'
    puts "obj.marshal dump: #{obj[0].marshal_dump}"
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    puts "json_obj: #{json_obj}"  
  end

end
