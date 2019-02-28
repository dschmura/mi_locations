class ClassroomsController < RoomsController
  def index
    @q = Room.classrooms.ransack(params[:q])
    @rooms = @q.result.includes(:building, :room_characteristics, :room_contact).page params[:page]
  end

  def set_room
      # @room = Room.find(params[:id])
      @room = Room.find_by facility_code_heprod:(params[:id].upcase)
    end
end
