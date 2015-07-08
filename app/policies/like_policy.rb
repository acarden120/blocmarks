class LikePolicy < ApplicationPolicy
  def create?
    user.present? && (record.bookmark.user != user)
  end
end
