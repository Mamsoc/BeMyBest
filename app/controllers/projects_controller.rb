class ProjectsController < ApplicationController
  before_action :set_projects, only: [:show, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Restaurant.new(projects_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @scenarios = Scenario.all
  end

  private

  def projects_params
    params.require(:project).permit(:funfact, :description)
  end

  def set_projects
    @project = Project.find(params[:id])
  end
end
