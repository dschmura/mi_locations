# == Schema Information
#
# Table name: rooms
#
#  id                          :bigint           not null, primary key
#  rmrecnbr                    :integer          not null
#  latitude                    :float
#  longitude                   :float
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

end
