class RoomPolicy < ApplicationPolicy
  include LdapableHelper
  class Scope < Scope
    def resolve
      if user && user.uniqname == 'admin'
        scope.all
      else
        scope.where(visible: true)
      end
    end
  end

  def index?
    true
  end

  def show?
    if user
      true
    else
      false
    end
  end

  def update?
    if user && member_of_group?(user.uniqname, 'lsa-mis-rails-admins')
      true
    else
      false
    end
  end


  def toggle_visibility?
    if user && user.uniqname == 'admin'
      true
    elsif user && member_of_group?(user.uniqname, 'lsa-mis-rails-admins')
      true
    else
      false
    end
  end

end
