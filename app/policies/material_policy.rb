class MaterialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.teacher
  end

  def update?
    user.teacher
  end

  def destroy?
    user.teacher
  end
end
