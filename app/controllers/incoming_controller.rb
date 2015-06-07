class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts ">>>>>>>>>> #{params.inspect}"

    user = User.find_by(email: params[:sender])
    subject = params[:subject]
    content = params[:'body-plain']

    topic = user.topics.find_or_create_by(title: subject)

    bookmark = user.bookmarks.build(topic: topic, url: content)

    if bookmark.save
      head 200
    else
      head :no_content
    end

#    head 200
  end
end