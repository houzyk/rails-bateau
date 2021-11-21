class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    record.participants.any? { |participant| participant.user_id == user.id }
  end

  def create?
    true
  end
end
