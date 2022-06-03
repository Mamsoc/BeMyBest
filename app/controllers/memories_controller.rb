class MemoriesController < ApplicationController
  before_action :set_project
  before_action :set_memory, except: [:create, :new, :index]
  def index
    @memories = policy_scope(@project.memories)
  end

  def show
    @memories = Memory.all
    authorize @memories
  end

  def edit
    authorize @memory
  end

  def update
    authorize @memory
    @memory.update(memories_params)
    redirect_to project_cards_path(@project)
  end

  def new
    @memory = Memory.new
    authorize @memory
  end

  def create
    @memory = Memory.new(memories_params)
    @memory.user = current_user
    @memory.project = @project
    @memory.legend = @memory.legend.capitalize
    authorize @memory
    if @memory.save
      redirect_to project_memories_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @memory
    @memory.destroy
    redirect_to project_memory_path(@memory)
  end

  private

  def memories_params
    params.require(:memory).permit(:legend, :card_id, :response, :photo)

  end

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
