class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :toggle_visibility]
  include Filterable
  def index

    # Filter by characteristics search (returns ActiveRecord relation )
    query = filter_composer(filtering_params2)
    @filtered_rooms = Room.where(rmrecnbr: query)
    # Ransack Search
    @q ||= Room.classrooms.ransack(params[:q])

    @results ||= policy_scope(@filtered_rooms.merge(@q.result)).includes( :building, :room_panorama_attachment, :room_characteristics, :room_contact, :alerts)

    @building_ids ||= @results.pluck(:building_id).uniq.sort

    @mappable_locations ||= Building.ann_arbor_campus.with_classrooms.where(id: @building_ids)

    @map_sauce = BuildingSerializer.new(@mappable_locations, each_serializer: BuildingSerializer).serializable_hash.to_json
    @results = RoomDecorator.decorate_collection(@results)



    @pagy, @rooms = pagy(@results, items: 9)


    # @rooms_json = serialize_rooms(@results)
    @searchable_buildings ||=  Building.ann_arbor_campus.with_classrooms.uniq.pluck(:nick_name, :abbreviation).collect{ |building| [building[0].titleize, building[1] ] }.sort

    @q.sorts = ["room_number ASC", "instructional_seating_count ASC"] if @q.sorts.empty?

    # fresh_when @results
    respond_to do |format|
      params[:view_preference] ||= "grid_view"
      if params[:view_preference] == "list_view"
        format.js
        format.html
        format.json { render json: {entries: render_to_string(partial: "rooms_row", collection: @rooms, as: :room, formats: [:html], cached: true), pagination: view_context.pagy_nav(@pagy) }}
      else
        format.js
        format.html
        format.json { render json: {entries: render_to_string(partial: "rooms_card", collection: @rooms, as: :room, formats: [:html], cached: true), pagination: view_context.pagy_nav(@pagy) }}
      end
    end
  end

  def show
    respond_to do |format|
      # format.js
      format.html
      format.json { render json: @room, serializer: RoomSerializer }
    end
  end

  # def search
  #   index
  #   render :index
  # end

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
    RoomSerializer.new(rooms, each_serializer: RoomSerializer).serializable_hash.to_json
  end

  def set_room
    fresh_when @room
    @room = Room.includes(:building, :room_characteristics, :room_panorama_attachment, :alerts, :room_contact).find(params[:id])
    authorize @room
    @room_json = serialize_rooms([@room])
    @room = @room.decorate
    # @room = Room.find_by facility_code_heprod:(params[:id].upcase) || Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:rmrecnbr, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :instructional_seating_count, :building_id, :room_image, :room_panorama, :room_layout, :visible, :page, :view_preference)
  end

  def filtering_params
    params.slice(:bluray, :chalkboard, :doccam, :interactive_screen, :instructor_computer, :lecture_capture, :projector_16mm, :projector_35mm, :projector_digital_cinema, :projector_digial, :projector_slide, :team_board, :team_tables, :team_technology, :vcr, :video_conf, :whiteboard).values
  end

  def filtering_params2
    params.slice(:filter_params)
  end

end
