class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @current_user_projects = policy_scope(Project.where(user_id: current_user))
  end
end
