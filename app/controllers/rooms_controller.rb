class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :toggle_visibility]

  def index
    if params[:q] && params[:q][:rooms_with_all_characteristics]

      @params = params[:q][:rooms_with_all_characteristics]
      @all_chars = RoomCharacteristic.has_all_characteristics(@params)

      @char_rooms = Room.classrooms.includes(:building, :room_characteristics).where(rmrecnbr: @all_chars)

      @q ||= Room.classrooms.includes(:building, :room_characteristics).ransack(params[:q])

      @q.sorts = ['room_number ASC', 'instructional_seating_count ASC' ] if @q.sorts.empty?

      @results = policy_scope( @q.result.merge(@char_rooms) )
      @rooms = @results.page(params[:page])
      @rooms_json = @rooms.to_json(:include => :building)

    else
      @q ||= Room.classrooms.includes(:building, :room_characteristics).ransack(params[:q])
      @q.sorts = ['instructional_seating_count asc', 'room_number asc'] if @q.sorts.empty?
      @results = policy_scope( @q.result(distinct: true) )
      @rooms = @results.page(params[:page])
      @rooms_json = @rooms.to_json(:include => :building)
    end
    respond_to do |format|
      # format.js
      format.html
      format.json { render json: @rooms.to_json(:include => :building) }

    end
  end

  def show
    @room_json = @room.to_json(:include => :building)

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

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id]).decorate
    authorize @room
    # @room = Room.find_by facility_code_heprod:(params[:id].upcase) || Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:rmrecnbr, :latitude, :longitude, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :instructional_seating_count, :building_id, :room_image, :visible, :page)
  end
end
