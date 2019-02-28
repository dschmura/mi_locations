class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :update]

  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result.includes(:rooms, :team_learning_classrooms).page
  end

  def show
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:building_image)
    end
end
