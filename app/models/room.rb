# == Schema Information
#
# Table name: rooms
#
#  id                          :bigint(8)        not null, primary key
#  rmrecnbr                    :integer          not null
#  latitude                    :float
#  longitude                   :float
#  floor                       :string           not null
#  room_number                 :string           not null
#  facility_code_heprod        :string           not null
#  rmtyp_description           :string
#  dept_id                     :integer
#  dept_grp                    :integer
#  square_feet                 :integer
#  instructional_seating_count :integer
#  building_id                 :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :building
  has_many :room_characteristics, dependent: :destroy
  has_one :room_contact, dependent: :destroy
  has_many :alerts, as: :alertable, dependent: :destroy

  validates_presence_of :rmrecnbr, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :building_id
  validates :instructional_seating_count, presence: true, if: -> {:rmtyp_description == 'Classroom' || 'Classroom Laboratory'}

  def self.classrooms
    where(rmtyp_description: ['Classroom', 'Class Laboratory'] )
  end

  def self.classrooms_labs
    where(rmtyp_description: ['Class Laboratory'] )
  end

  def self.team_learning_classrooms
    where(rmtyp_description: ['Classroom'] )
  end


end
