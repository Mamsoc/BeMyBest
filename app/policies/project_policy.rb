class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
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

  def edit?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def new?
    create?
  end

  def win?
    true
  end

  def thanks?
    true
  end

  def destroy?
    true
  end

  def fav?
    user == record.user
  end
end
