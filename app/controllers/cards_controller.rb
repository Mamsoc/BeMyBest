class CardsController < ApplicationController

  def index
    @cards = Card.all.select { |card| card.scenario == @project.scenario }
    authorize @cards
  end

  def show
    authorize @cards
  end

  private

  def projects_params
    params.require(:project).permit(:scenario_id)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
