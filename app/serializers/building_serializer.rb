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
  has_many :classrooms
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

end
