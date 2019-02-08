class ClassroomsController < RoomsController
  def index
    @q = Room.classrooms.ransack(params[:q])
    @rooms = @q.result.includes(:building, :room_characteristics, :room_contact).page params[:page]
  end
end
