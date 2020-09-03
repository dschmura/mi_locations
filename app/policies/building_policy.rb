class BuildingPolicy < ApplicationPolicy
  include LdapableHelper
  class Scope < Scope
    def user_in_group?
      # user.authorized_groups.includes?
      if user.mcommunity_groups.include?("mi-locations-notify")
        true
      else
        false
      end
    end
    def resolve
      if user && user_in_group?
        scope.all
      else
        # scope.where(visible: true)
        scope.all
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    if user
      true
    end
  end
end

private

def user_in_group?
  # user.authorized_groups.includes?
  if user.mcommunity_groups.include?("mi-locations-notify")
    true
  else
    false
  end
end