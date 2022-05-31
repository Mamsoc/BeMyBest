class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @projects = Project.new
  end


  private

  def projects_params
    params.require(:project).permit(:funfact, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
