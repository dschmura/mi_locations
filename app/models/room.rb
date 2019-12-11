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

class Room < ApplicationRecord
  include Filterable
  belongs_to :building
  has_many :room_characteristics, dependent: :destroy
  has_one :room_contact, dependent: :destroy
  has_many :alerts, as: :alertable, dependent: :destroy
  has_one_attached :room_image
  has_one_attached :room_panorama
  has_one_attached :room_layout

  validates_presence_of :rmrecnbr, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :building_id
  validates :instructional_seating_count, presence: true, if: -> { :rmtyp_description == "Classroom" || "Classroom Laboratory" }

  validates_uniqueness_of :rmrecnbr

  def update_room_characteristics_array
    rmrecnbrs = RoomCharacteristic.pluck(:rmrecnbr).uniq
    rmrecnbrs.each do |rmrecnbr|
      room = Room.find_by(rmrecnbr: rmrecnbr)
      chars = RoomCharacteristic.where(rmrecnbr: rmrecnbr).pluck(:chrstc_descrshort).uniq.sort

      room.characteristics = chars
      room.save
    end
  end

  # Scopes for room characteristics stored in characteristics array column in Room model
  scope :bluray, -> {
                   where("characteristics && ARRAY[?]", ["BluRay", "BluRay/DVD"])
                 }
  scope :chalkboard, -> {
                       where("characteristics && ARRAY[?]", ["Chkbrd>25", "Chkbrd"])
                     }
  scope :doccam, -> {
                   where("characteristics && ARRAY[?]", ["DocCam"])
                 }
  scope :interactive_screen, -> {
                               where("characteristics && ARRAY[?]", ["IntrScreen"])
                             }
  scope :instructor_computer, -> {
                                where("characteristics && ARRAY[?]", ["InstrComp", "CompPodPC", "CompPodMac"])
                              }
  scope :lecture_capture, -> {
                            where("characteristics && ARRAY[?]", ["LectureCap"])
                          }
  scope :projector_16mm, -> {
                           where("characteristics && ARRAY[?]", ["Proj16mm"])
                         }
  scope :projector_35mm, -> {
                           where("characteristics && ARRAY[?]", ["Proj35mm"])
                         }
  scope :projector_digital_cinema, -> {
                                     where("characteristics && ARRAY[?]", ["ProjD-Cin"])
                                   }
  scope :projector_digial, -> {
                             where("characteristics && ARRAY[?]", ["ProjDigit"])
                           }
  scope :projector_slide, -> {
                            where("characteristics && ARRAY[?]", ["ProjSlide"])
                          }
  scope :team_board, -> {
                       where("characteristics && ARRAY[?]", ["TeamBoard"])
                     }
  scope :team_tables, -> {
                        where("characteristics && ARRAY[?]", ["TeamTables"])
                      }
  scope :team_technology, -> {
                            where("characteristics && ARRAY[?]", ["TeamTech"])
                          }
  scope :vcr, -> {
                where("characteristics && ARRAY[?]", ["VCR"])
              }
  scope :video_conf, -> {
                       where("characteristics && ARRAY[?]", ["VideoConf"])
                     }
  scope :whiteboard, -> {
                       where("characteristics && ARRAY[?]", ["Whtbrd>25", "Whtbrd"])
                     }

  scope :visible, -> {
                    where(visible: true)
                  }

  scope :ann_arbor, -> {
                      joins(:building).merge(Building.ann_arbor_campus)
                    }

  scope :classrooms, -> {
                       where(rmtyp_description: ["Classroom"])
                     }

  def self.classrooms_labs
    where(rmtyp_description: ["Class Laboratory"])
  end

  def self.classrooms_including_labs
    where(rmtyp_description: ["Classroom", "Class Laboratory"])
  end

  def self.team_learning_classrooms
    where(rmtyp_description: ["Classroom"])
  end

  def team_learning_classroom?
    (room_characteristics.pluck(:chrstc_descrshort) & ["TeamTables", "TeamBoard", "TeamTech"]).any?
  end

  def mark_rooms_as_hidden(rmrecnbrs)
    rooms = Room.where(rmrecnbr: rmrecnbrs.compact)
    rooms.update_all(visible: false)
  end

  def mark_rooms_as_visible(rmrecnbrs)
    rooms = Room.where(rmrecnbr: rmrecnbrs.compact)
    rooms.update_all(visible: true)
  end
end
