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
    if user && user_in_group?
      true
    else
      false
    end
  end

  def update?
    if user && user_in_group?
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

def user_in_group?
  # user.authorized_groups.includes?
  if user.mcommunity_groups.include?("mi-locations-notify")
    true
  else
    false
  end
end