class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update]

  def index
    @q = Room.classrooms.includes(:building, :room_characteristics).ransack(params[:q])
    @rooms = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @rooms }
      format.js
    end
  end

  def show
  end

  def search
    index
    render :index
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
    # @room = Room.find_by facility_code_heprod:(params[:id].upcase) || Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:rmrecnbr, :latitude, :longitude, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :instructional_seating_count, :building_id, :room_image, :visible, :page)
  end
end
