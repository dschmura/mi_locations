require "csv"
require "benchmark"
require "active_record"
require "activerecord-import"

CSV::Converters[:blank_to_nil] = lambda do |field|
  field && field.empty? ? nil : field
end

class RoomsImporter

  ROOM_PARAMS = [:rmrecnbr, :latitude, :longitude, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :dept_description, :square_feet, :instructional_seating_count,
                 :building_id, :visible].freeze

  HEADER_MAP = {"RMRECNBR" => :rmrecnbr,
                "DEPTID" => :dept_id,
                "DEPT_DESCR" => :dept_description,
                "DEPT_GRP" => :dept_grp,
                "BLDRECNBR" => :bldrecnbr,
                "FLOOR" => :floor,
                "RMNBR" => :room_number,
                "RMSQRFT" => :square_feet,
                "RMTYP_DESCR50" => :rmtyp_description,
                "FACILITY_ID" => :facility_code_heprod,
                "RM_INST_SEAT_CNT" => :instructional_seating_count}.freeze

  def initialize
    puts 'method: initialize'
    file = Rails.root.join("uploads/rooms.csv")
    @rmrecnbrs = Room.all.pluck(:rmrecnbr)
    @buildings = Building.all.group_by(&:bldrecnbr)
    @rooms = prepare_data_for_import(file)
  end

  def prepare_data_for_import(file)
      load_rooms_from_csv(file)
      map_rooms_with_buildings
      map_building_ids
      map_instructional_seating_count
      map_rooms_compact
      map_rooms_for_import
  end

  def load_rooms_from_csv(file)
    @rooms = []
    CSV.foreach(file, headers: true, header_converters: lambda { |header| HEADER_MAP[header] }) do |row|
      @rooms << row.to_hash
    end
  end

  def import_rooms
    create_rooms
    # update_rooms
  end

  def create_rooms
    filter_creatable_rooms(@rooms)
    Room.import @creatable_rooms, recursive: true, validate: true, batch_size: 1000

    room_logger.info "Created: #{@creatable_rooms.count} rooms."
  end

  def update_rooms
    filter_updatable_rooms(@rooms)

    Room.import @updatable_rooms, on_duplicate_key_update: {conflict_target: [:rmrecnbr], columns: [:floor, :room_number, :rmtyp_description, :dept_id, :dept_grp, :dept_description, :square_feet, :facility_code_heprod, :instructional_seating_count,
    :building_id,]}, validate: false, batch_size:  1000

    room_logger.info "Updated: #{@updatable_rooms.count} rooms."
  end

  ## MAPS
  def map_building_ids
    @rooms.each.map { |room| room[:building_id] = bldrecnbr_to_building_id(room[:bldrecnbr].to_i) }
  end

  def map_instructional_seating_count
    @rooms.each.map { |room| room[:instructional_seating_count] = (room[:instructional_seating_count] || 0) }
  end

  # def map_facility_code_heprod
  #   puts 'method: map_facility_code_heprod'
  #       puts "map_facility_code_heprod @rooms: #{@rooms.size}"
  #   @rooms.each.map { |room| room[:facility_code_heprod] = "clown car" }
  # end

  def map_rooms_with_buildings
    @rooms = @rooms.select! { |room| building_exists?(room[:bldrecnbr]) }
  end

  def map_rooms_compact
    puts "before compact: "#{@rooms.size}
    @rooms.map { |row| row.compact! }
    puts "after compact: "#{@rooms.size}
  end

  ## Remove fields that aren't in our model (ROOM_PARAMS is an array of acceptable fields)
  def map_rooms_for_import
    @rooms.map { |room| room.slice(*ROOM_PARAMS) }
  end

  ## HELPER METHODS

  def building_exists?(bldrecnbr)
    @buildings.include?(bldrecnbr.to_i)
  end

  def bldrecnbr_to_building_id(bldrecnbr)
    if building_exists?(bldrecnbr)
      @buildings[bldrecnbr][0].id
    else
      room_logger.info "Building did not exist: #{bldrecnbr}."
    end
  end

  def find_file(file)
    Rails.root.join(file)
  end

  def filter_creatable_rooms(rooms)
    @creatable_rooms = []
    @creatable_rooms = rooms.reject { |room| room_exists?(room[:rmrecnbr])}
    @creatable_rooms
  end

  def filter_updatable_rooms(rooms)
    @updateable_rooms = []
    @updatable_rooms = rooms.select { |room| room_exists?(room[:rmrecnbr])}
    @updatable_rooms
  end

  def room_exists?(rmrecnbr)
    @rmrecnbrs.include?(rmrecnbr.to_i)
  end

  def room_logger
    @@room_logger ||= Logger.new("#{Rails.root}/log/room_importer.log")
  end
end
