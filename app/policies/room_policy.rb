class RoomPolicy < ApplicationPolicy
  include LdapableHelper
  class Scope < Scope
    def resolve
      if
user&.uniqname
        scope.all
      else
        scope.where(visible: true)
        # scope.all
      end
    end
  end

  def index?
    true
  end

  def show?
    # if user && member_of_department?
    if user
      true
    else
      false
    end
  end

  def update?
    # if user && member_of_group?(user.uniqname, 'lsa-mis-rails-admins')
    if user && user_in_group?
      true
    else
      false
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

  def toggle_visibility?
    if user && user_in_group?
      true
    else
      false
    end
  end
end
