class BookmarkPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present? && (record.topic.user == user)
  end

  def destroy?
    user.present? && (record.topic.user == user)
  end

  def update?
    user.present? && (record.topic.user == user)
  end

  def edit?
    update?
  end

  def like?
    user.present? && (record.user != user)
  end
end
