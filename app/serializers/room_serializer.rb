class RoomSerializer < ActiveModel::Serializer
  attributes :id, :rmrecnbr, :floor, :room_number, :facility_code_heprod, :dept_grp, :instructional_seating_count, :dept_description, :building

  def buildling
    { building_bldrecnbr: self.object.building.bldrecnbr,
      building_latitude: self.object.building.latitude,
      building_longitude: self.object.building.longitude,
      building_name: self.object.building.name,
      building_nick_name: self.object.building.nick_name,
      building_abbreviation: self.object.building.abbreviation,
      building_address: self.object.building.address,
      building_city: self.object.building.city,
      building_state: self.object.building.state,
      building_zip: self.object.building.zip }
  end
end



# serializer = RoomSerializer.new(@room).as_json
# serializer[:building][:latitude]