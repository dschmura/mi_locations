# == Schema Information
#
# Table name: rooms
#
#  id                          :bigint           not null, primary key
#  rmrecnbr                    :integer          not null
#  floor                       :string           not null
#  room_number                 :string           not null
#  facility_code_heprod        :string           not null
#  rmtyp_description           :string
#  dept_id                     :integer
#  dept_grp                    :string
#  square_feet                 :integer
#  instructional_seating_count :integer
#  building_id                 :bigint
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  visible                     :boolean          default(FALSE), not null
#  dept_description            :string
#  characteristics             :text             default([]), is an Array
#

class RoomSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 12.hours
  has_one :building
  attributes :id,
   :rmrecnbr,
   :floor,
   :room_number,
   :facility_code_heprod,
   :dept_grp,
   :instructional_seating_count,
   :dept_description,
   :building

   attribute :latitude do |object|
    "#{object.building.latitude}"
    end

  attribute :longitude do |object|
    "#{object.building.longitude}"
  end

  attribute :location_name do |object|
    "#{object.building.name.titleize}"
  end

  attribute :location_address do |object|
    "#{object.building.address.titleize}"
  end


end
