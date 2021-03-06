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

class Building < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :classrooms, -> { classrooms }, class_name: "Room"
  has_many :classrooms_labs, -> { classrooms_labs }, class_name: "Room"
  has_many :team_learning_classrooms, -> { team_learning_classrooms }, class_name: "Room"

  has_one_attached :building_image

  has_many :floors, dependent: :destroy
  has_many :alerts, as: :alertable, dependent: :destroy

  validates_presence_of :bldrecnbr, :name, :address, :city, :state, :zip, :country

  geocoded_by :address # can also be an IP address

  # Room.classrooms.joins(:building).merge(Building.ann_arbor_campus).count
  scope :ann_arbor_campus, -> {
    where("zip ILIKE ANY ( array[?] )", ["48103%", "48104%", "48105%", "48109%"])
  }

  scope :with_classrooms, -> {
                            joins(:rooms).merge(Room.classrooms)
                          }

  def self.classrooms?
    where(room.classrooms.any?)
  end
end
