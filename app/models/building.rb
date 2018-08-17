# == Schema Information
#
# Table name: buildings
#
#  id           :bigint(8)        not null, primary key
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

class Building < ApplicationRecord
  has_one_attached :main_picture
  has_many :rooms, dependent: :destroy
  validates_presence_of :bldrecnbr, :name, :address, :city, :state, :zip, :country

  geocoded_by :address   # can also be an IP address
end
