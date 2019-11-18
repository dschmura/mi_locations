class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :toggle_visibility]

  def index

    if params.dig(:q, :rooms_with_all_characteristics)
      q_params = params.fetch(:q, {}).fetch(:rooms_with_all_characteristics, [])
      # Query RoomChaacteristics
      @all_chars = RoomCharacteristic.has_all_characteristics(q_params)

      @char_rooms = Room.classrooms.joins(:building).merge(Building.ann_arbor_campus).includes(:building, :room_image_attachment, :alerts).where(rmrecnbr: @all_chars)

      @q ||= Room.classrooms.joins(:building).merge(Building.ann_arbor_campus).includes(:building,:room_image_attachment, :alerts).ransack(params[:q])

      @q.sorts = ['room_number ASC', 'instructional_seating_count ASC' ] if @q.sorts.empty?

      @results = policy_scope( @q.result.merge(@char_rooms) )
      @rooms = @results.page(params[:page]).per(15).decorate
      @rooms_json = serialize_rooms(@results)

    else
      puts "NO PARAMS"
      @q ||= Room.classrooms.joins(:building).merge(Building.ann_arbor_campus).includes(:building,:room_image_attachment, :alerts).ransack(params[:q])
      @q.sorts = ['instructional_seating_count asc', 'room_number asc'] if @q.sorts.empty?

      @results = policy_scope( @q.result(distinct: true) )
      @rooms = @results.page(params[:page]).per(15).decorate
      @rooms_json = serialize_rooms(@results)

    end
    respond_to do |format|
      # format.js
      format.html
      # format.json { render json: @rooms.to_json(:include => :building) }
      format.json  { render json: @results, each_serializer: RoomSerializer }

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

  def toggle_visibility
    @room.toggle(:visible).save
    respond_to do |format|
      format.js
    end
  end

  private

  def serialize_rooms(rooms)
    ActiveModelSerializers::SerializableResource.new(rooms, each_serializer: RoomSerializer).to_json
  end

  def set_room
    @room = Room.includes(:building, :room_characteristics,:room_image_attachment, :alerts, :room_contact).find(params[:id])
    authorize @room
    @room_json = serialize_rooms([@room])
    @room = @room.decorate
    # @room = Room.find_by facility_code_heprod:(params[:id].upcase) || Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:rmrecnbr, :latitude, :longitude, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :instructional_seating_count, :building_id, :room_image, :room_panorama, :room_layout, :visible, :page)
  end
end
