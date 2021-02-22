# == Schema Information
#
# Table name: buildings
#
#  id           :bigint           not null, primary key
#  bldrecnbr    :integer
#  latitude     :float
#  longitude    :float
#  name         :string           not null
#  nick_name    :string           not null
#  abbreviation :string
#  address      :string           not null
#  city         :string           not null
#  state        :string           not null
#  zip          :string           not null
#  country      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BuildingSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
   :bldrecnbr,
   :latitude,
   :longitude,
   :name,
   :nick_name, :abbreviation,
   :address,
   :city,
   :state,
   :zip

  attribute :latitude do |object|
    "#{object.latitude}"
    end

  attribute :longitude do |object|
    "#{object.longitude}"
  end

  attribute :location_name do |object|
    "#{object.name.titleize}"
  end

  attribute :location_address do |object|
    "#{object.address.titleize}"
  end
end
