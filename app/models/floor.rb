# == Schema Information
#
# Table name: floors
#
#  id          :bigint           not null, primary key
#  label       :string
#  building_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Floor < ApplicationRecord
  belongs_to :building
  has_one_attached :floor_image
  before_save :set_building

  def set_building
    building
  end

  def floor_svg
    ActiveStorage::Blob.service.send(:path_for, floor_image.key)
  end
  validates_uniqueness_of :label, scope: :building_id
end

# floors = Room.all.pluck(:floor).uniq
