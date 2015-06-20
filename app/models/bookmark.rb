class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes
  has_many :users, through: :likes
end
