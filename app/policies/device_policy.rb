class DevicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def edit?
    update?
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
