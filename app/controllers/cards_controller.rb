class CardsController < ApplicationController
  before_action :set_project, :set_memories

  def index
    @cards = policy_scope(Card)
    @cards = @cards.where(scenario: @project.scenario)
  end

  def show
    @card = Card.find(params[:id])
    authorize @card
  end

  private

  def projects_params
    params.require(:project).permit(:scenario_id)
  end

  def set_memories
    @memories = policy_scope(@project.memories)
  end

  def set_project
    @project = Project.find(params[:project_id])
    authorize @project
  end
end
