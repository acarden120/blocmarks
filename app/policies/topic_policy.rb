class TopicPolicy < ApplicationPolicy
  def show?
    user.present?
  end
end
