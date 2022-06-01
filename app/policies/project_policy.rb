class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def index?
      record.user == @current_user
    end

    def new?
      create?
    end

    def create?
      true
    end

  end
end
