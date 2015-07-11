class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :user
  has_many :bookmarks
end
