class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(email: params[:sender])
    subject = params[:subject]
    content = params[:'body-plain']

    topic = user.topics.find_or_create_by(title: subject)

    bookmark = topic.bookmarks.build(topic: topic, url: content)

    head 200 if bookmark.save
  end
end
