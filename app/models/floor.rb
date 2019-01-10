# == Schema Information
#
# Table name: floors
#
#  id          :bigint(8)        not null, primary key
#  label       :string
#  building_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Floor < ApplicationRecord
  belongs_to :building
  has_one_attached :floor_image
  before_save :set_building

  def set_building
    self.building
  end

 validates_uniqueness_of :label, :scope => :building_id
end

# floors = Room.all.pluck(:floor).uniq
