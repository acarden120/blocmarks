class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics, dependent: :destroy
  has_many :likes
  has_many :bookmarks, through: :likes

  def liked(post)
    likes.where(bookmark_id: @bookmark.id).first
  end
end
