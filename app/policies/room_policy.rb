class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
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
    if user
      true
    else
      false
    end
  end


  def toggle_visibility?
    if user
      true
    else
      false
    end
  end

end
