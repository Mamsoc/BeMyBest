class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def skip_pundit?
    true
  end

  def index
    @project = Project.find(params[:project_id])
    @card = @project.scenario.cards.first
  end

  def show
    @project = Project.find(params[:project_id])
    @card = Card.find(params[:id])
    @cards = @project.scenario.cards
    @next_card = @cards[@cards.index(@card) + 1]
  end

end
