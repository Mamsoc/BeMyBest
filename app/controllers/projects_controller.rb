class ProjectsController < ApplicationController
  before_action :set_projects, only: [:show, :edit, :update, :destroy]
  def index
    @current_user_projects = Project.where(:admin_id == current_user)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(projects_params)
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def projects_params
    params.require(:project).permit(:funfact, :description)
  end

  def set_projects
    @project = Project.find(params[:id])
    authorize @project
  end
end
