class PagesController < ApplicationController
  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result.includes(:rooms, :team_learning_classrooms).page
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
