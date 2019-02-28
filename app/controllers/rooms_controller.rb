class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result.includes(:building, :room_characteristics).page params[:page]
  end

  def show
  end

  def search
    index
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
      # @room = Room.find_by facility_code_heprod:(params[:id].upcase) || Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:rmrecnbr, :latitude, :longitude, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :instructional_seating_count, :building_id)
    end
end
