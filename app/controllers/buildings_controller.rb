class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :update]

  def index
    @q = Building.ransack(params[:q])
    @results = policy_scope(@q.result(distinct: true).includes(:rooms, :team_learning_classrooms))
    @pagy, @buildings = pagy(@results, items: 10)

    @searchable_buildings =  Building.ann_arbor_campus.with_classrooms.uniq.pluck(:nick_name, :abbreviation).collect{ |building| [building[0].titleize, building[1] ] }.sort

    respond_to do |format|
      format.js
      format.html
      format.json { render json: @buildings }
    end
  end

  def search
    index
    render :index
  end

  def show

  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def serialize_buildings(buildings)
    BuildingSerializer.new(buildings, each_serializer: BuildingSerializer).serializable_hash.to_json
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = Building.find(params[:id])
    authorize @building
    @building_json = serialize_buildings([@building])
  end

  def building_params
    params.require(:building).permit(:building_image)
  end
end
