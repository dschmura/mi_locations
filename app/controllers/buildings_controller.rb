class BuildingsController < ApplicationController
  before_action :set_building, only: [:show]

  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result.includes(:rooms, :team_learning_classrooms).page
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end
end
