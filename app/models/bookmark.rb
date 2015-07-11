class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: :slugged

  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

 def should_generate_new_friendly_id?
    new_record?
  end

end
