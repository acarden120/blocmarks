module UsersHelper
  def get_preview(url)
#    embedly_api =
#    Embedly::API.new :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
     embedly_api = Embedly::API.new :key => 'd4ac3dd9d08c4b248f85e4225483471d',
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    # single url
#    obj = embedly_api.oembed :url => 'http://www.youtube.com/watch?v=sPbJ4Z5D-n4&feature=topvideos'
    obj = embedly_api.oembed :url => url
    puts obj[0].marshal_dump
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    puts json_obj  
  end
end
