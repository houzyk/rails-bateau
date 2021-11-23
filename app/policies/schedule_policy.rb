class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('user_id = ? or public = ?', user, true)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
