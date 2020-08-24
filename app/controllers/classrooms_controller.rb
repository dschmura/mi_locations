class ClassroomsController < RoomsController
  def index
    # Ransack search (returns ActiveRecord relation )
    @q ||= Room.classrooms.ransack(params[:q])
    # Filter by characteristics search (returns ActiveRecord relation )
    rooms = Room.classrooms.filter_params(filtering_params)

    @results = policy_scope(@q.result.merge(rooms).joins(:building).merge(Building.ann_arbor_campus).includes(:building, :room_image_attachment, :room_panorama_attachment, :alerts))
    @pagy, @rooms = pagy(@results, items: 9)
    @rooms_json = serialize_rooms(@results)

    @q.sorts = ["room_number ASC", "instructional_seating_count ASC"] if @q.sorts.empty?

    respond_to do |format|
      format.js
      format.html
      format.json { render json: @results, each_serializer: RoomSerializer }
    end
  end

  def show
    respond_to do |format|
      # format.js
      format.html
      format.json { render json: @room, serializer: RoomSerializer }
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
