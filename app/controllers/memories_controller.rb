class MemoriesController < ApplicationController
  before_action :set_project
  before_action :set_memory, except: [:create, :new]
  def index
    # authorize @memory
    @memory = Memory.all

  end

  def edit
    # authorize @memory
  end

  def update
    # authorize @memory
    @memory.update(memories_params)
    redirect_to edit_project_memory_path(@memory)
  end

  def new
    @memory = Memory.new
    # authorize @memory
  end

  def create
    @memory = Memory.new(memories_params)
    @memory.user = current_user
    # authorize @memory
    @memory.legend = @memory.legend.capitalize
    if @memory.save
      redirect_to new_project_memory_path(@memory)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @memory
    @memory.destroy
    redirect_to project_memory_path(@memory)
  end

  private

  def memories_params
    params.require(:memory).permit(:legend, :description, photos: [])

  end

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
