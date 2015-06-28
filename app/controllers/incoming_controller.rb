class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
<<<<<<< HEAD
    puts ">>>>>>>>>> #{params.inspect}"
    user = User.find_by(email: params[:sender])
    subject = params[:subject]
    content = params[:'body-plain']

    topic = user.topics.find_or_create_by(title: subject)

    bookmark = topic.bookmarks.build(topic: topic, url: content)

    if bookmark.save
      head 200
    end
=======
    user = User.find_by(email: params[:sender])
    subject = params[:subject]
    content = params[:'body-plain']
    topic = user.topics.find_or_create_by(title: subject)
    bookmark = topic.bookmarks.build(topic: topic, url: content)

    bookmark.save
>>>>>>> f134157ebb70b65c4067e21a662adf5313a2700f
  end
end
