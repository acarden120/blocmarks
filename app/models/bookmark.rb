class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url

  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
end
