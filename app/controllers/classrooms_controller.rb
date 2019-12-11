class ClassroomsController < RoomsController
  def index
    @q = Room.classrooms.ransack(params[:q])
    @rooms = @q.result(distinct: true).includes(:building, :room_characteristics, :room_contact).order(id: :asc).page params[:page]

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @rooms }
      format.js
    end
  end

  def search
    index
    render :index
  end

  private

  def set_room
    # @room = Room.find(params[:id])
    @room = Room.find_by facility_code_heprod: params[:id].upcase
  end
end
