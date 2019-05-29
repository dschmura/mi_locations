require "csv"
require "benchmark"
require "active_record"
require "activerecord-import"

CSV::Converters[:blank_to_nil] = lambda do |field|
  field && field.empty? ? nil : field
end

class RoomCharacteristicsImporter
  HEADER_MAP = {"RMRECNBR" => :rmrecnbr,
                "CHRSTC" => :chrstc,
                "CHRSTC_EFF_STATUS" => :chrstc_eff_status,
                "CHRSTC_DESCRSHORT" => :chrstc_descrshort,
                "CHRSTC_DESCR" => :chrstc_descr,
                "CHRSTC_DESCR254" => :chrstc_desc254}.freeze

  def initialize
    file = find_file("uploads/room_characteristics.csv")
    # @rmrecnbrs = Room.all.pluck(:rmrecnbr)
    @classrooms = Room.classrooms.group_by(&:rmrecnbr)
    @room_characteristics = load_room_characteristics_from_csv(file)
    import_room_characteristics
    # @buildings =  Building.all.group_by &:bldrecnbr
  end

  def room_characteristics_logger
    @@room_characteristics_logger ||= Logger.new("#{Rails.root}/log/room_characteristics_importer.log")
  end

  def room_exists?(rmrecnbr)
    @classrooms.include?(rmrecnbr.to_i)
  end

  def set_room(rmrecnbr)
    @room = @classrooms[rmrecnbr][0]
  end

  # def smarter_csv_import(file)
  #   @imported_room_characteristics = SmarterCSV.process(file)
  # end

  def load_characteristics_for_room(rmrecnbr)
    @characteristics = @room_characteristics.select { |characteristic| characteristic[:rmrecnbr] == @classroom.rmrecnbr }
  end

  def rooms_with_characteristics
    @rooms_with_characteristics = @room_characteristics.map { |rc| rc[:rmrecnbr]}.uniq
  end

  def load_room_characteristics_from_csv(file)
    room_characteristics = []
    CSV.foreach(file, headers: true, header_converters: lambda { |header| HEADER_MAP[header] }) do |row|
      room_characteristics << row.to_hash
    end
    room_characteristics.each { |k| k.delete_if { |k, v| k.nil? } }
  end

  def map_room_ids
    @room_characteristics.each.map { |rc| rc[:room_id] = rmrecnbr_to_room_id(rc[:rmrecnbr].to_i) }
  end

  def rmrecnbr_to_room_id(rmrecnbr)
    if room_exists?(rmrecnbr)
      @classrooms[rmrecnbr][0].id
    else
      # room_logger.info "Building did not exist: #{bldrecnbr}."
    end
  end

  def import_room_characteristics
    map_room_ids
    RoomCharacteristic.delete_all
    RoomCharacteristic.import @room_characteristics, recursive: true, validate: false, batch_size: 1000
  end

  # def import(file)
  #   # load File
  #   # read each row
  #   CSV.foreach(file, headers: true,
  #                     converters: [:blank_to_nil]) do |row|
  #
  #     if room_exists?(row['RMRECNBR'].to_i)
  #       set_room(row['RMRECNBR'].to_i)
  #       @room.room_characteristics.destroy_all
  #       @room.add_room_characteristics
  #       # update_room(row)
  #       # clear room characteristics?
  #       # write new characteristics?
  #       ### Dependent destroy?
  #     end
  #   end
  # end




  def find_room(row_rmrecnbr)
    Room.find_by(rmrecnbr: row_rmrecnbr) || nil
  end

  def find_file(file)
    Rails.root.join(file)
  end
end
