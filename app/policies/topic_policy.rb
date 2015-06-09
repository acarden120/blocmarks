class TopicPolicy < ApplicationPolicy
  include Pundit

  def show?
    scope.where(:id => record.id).exists? && user.present?
  end
end