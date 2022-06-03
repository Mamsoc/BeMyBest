class ProjectsController < ApplicationController
  before_action :set_projects, only: [:show, :update, :edit, :destroy]

  def index
    @current_user_projects = policy_scope(Project.where(user_id: current_user))
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(projects_params)
    @project.user = current_user
    @project.code = SecureRandom.hex(5)
    authorize @project
    if @project.save
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @scenarios = Scenario.all
    authorize @project
  end

  def update
    authorize @project
    if @project.update(projects_params)
      redirect_to project_cards_path(@project), notice: "Scenario choisi"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def win
    @project = Project.find(params[:project_id])
    authorize @project
  end

  private


  def projects_params
    params.require(:project).permit(:title, :description, :photo, :scenario_id)
  end

  def set_projects
    @project = Project.find(params[:id])
    authorize @project
  end
end
