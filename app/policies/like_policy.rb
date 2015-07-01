class LikePolicy < ApplicationPolicy
  def create?
    user.present? && (record.user != user)
  end
end
