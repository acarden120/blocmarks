class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts ">>>>>>>>>> #{params.inspect}"
    user = User.find_by(email: params[:sender])
    subject = params[:subject]
    content = params[:'body-plain']

    topic = user.topics.find_or_create_by(title: subject)

    bookmark = user.topics.bookmarks.build(topic: topic, url: content)

    if bookmark.save
      head 200
    end
  end
end