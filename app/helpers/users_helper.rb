module UsersHelper
  require 'embedly'
  require 'json'

  def get_preview(_url)
    embedly_api = Embedly::API.new { key: 'd4ac3dd9d08c4b248f85e4225483471d' },
        { user_agent: 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)' }
    obj = embedly_api.oembed :url => url
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
  end
end
