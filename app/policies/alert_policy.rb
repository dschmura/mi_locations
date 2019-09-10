class AlertPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    if user
      true
    else
      false
    end
  end
  def edit?
    if user
      true
    else
      false
    end
  end
  def create?
    if user
      true
    else
      false
    end
  end
  def destroy?
    if user
      true
    else
      false
    end
  end

end
