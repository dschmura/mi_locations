require "csv"
require "benchmark"
require "active_record"
require "activerecord-import"

CSV::Converters[:blank_to_nil] = lambda do |field|
  field && field.empty? ? nil : field
end

class RoomContactsImporter
  HEADER_MAP = {"RMRECNBR" => :rmrecnbr,
                "RM_SCHD_CNTCT_NAME" => :rm_schd_cntct_name,
                "RM_SCHD_EMAIL" => :rm_schd_email,
                "RM_SCHD_CNTCT_PHONE" => :rm_schd_cntct_phone,
                "RM_DET_URL" => :rm_det_url,
                "RM_USAGE_GUIDLNS_URL" => :rm_usage_guidlns_url,
                "RM_SPPT_DEPTID" => :rm_sppt_deptid,
                "RM_SPPT_DEPT_DESCR" => :rm_sppt_dept_descr,
                "RM_SPPT_CNTCT_EMAIL" => :rm_sppt_cntct_email,
                "RM_SPPT_CNTCT_PHONE" => :rm_sppt_cntct_phone,
                "RM_SPPT_CNTCT_URL" => :rm_sppt_cntct_url,}.freeze

  def initialize
    file = find_file("uploads/room_contacts.csv")
    @rooms = Room.all.group_by(&:rmrecnbr)
    @room_contacts = load_room_contacts_from_csv(file)
    import_room_contacts
    # @buildings =  Building.all.group_by &:bldrecnbr
  end

  def room_contacts_logger
    @@room_contacts_logger ||= Logger.new("#{Rails.root}/log/room_contacts_importer.log")
  end

  def room_exists?(rmrecnbr)
    @rooms.include?(rmrecnbr.to_i)
  end

  def set_room(rmrecnbr)
    @room = @rooms[rmrecnbr][0]
  end

  def load_characteristics_for_room(rmrecnbr)
    @characteristics = @room_contacts.select { |characteristic| characteristic[:rmrecnbr] == @classroom.rmrecnbr }
  end

  def rooms_with_characteristics
    @rooms_with_characteristics = @room_contacts.map { |rc| rc[:rmrecnbr] }.uniq
  end

  def load_room_contacts_from_csv(file)
    room_characteristics = []
    CSV.foreach(file, headers: true, header_converters: lambda { |header| HEADER_MAP[header] }) do |row|
      room_characteristics << row.to_hash
    end
    room_characteristics.each { |k| k.delete_if { |k, v| k.nil? } }
  end

  def map_room_ids
    @room_contacts.each.map { |rc| rc[:room_id] = rmrecnbr_to_room_id(rc[:rmrecnbr].to_i) }
  end

  def rmrecnbr_to_room_id(rmrecnbr)
    if room_exists?(rmrecnbr)
      @rooms[rmrecnbr][0].id
    else
      # room_contacts_logger.info "Room did not exist: #{rmrecnbr}."
    end
  end

  def import_room_contacts
    map_room_ids
    RoomContact.delete_all
    RoomContact.import @room_contacts, recursive: true, validate: false, batch_size: 1000
  end

  def find_room(row_rmrecnbr)
    Room.find_by(rmrecnbr: row_rmrecnbr) || nil
  end

  def find_file(file)
    Rails.root.join(file)
  end
end
