class InvitationsController < ApplicationController
  def show
    project = Project.find_by(code: params[:id])
    authorize project
    redirect_to project_path(project)
  end
end
