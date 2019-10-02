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
#

class Room < ApplicationRecord

  belongs_to :building
  has_many :room_characteristics, dependent: :destroy
  has_one :room_contact, dependent: :destroy
  has_many :alerts, as: :alertable, dependent: :destroy
  has_one_attached :room_image
  has_one_attached :room_panorama

  validates_presence_of :rmrecnbr, :floor, :room_number, :facility_code_heprod, :rmtyp_description, :dept_id, :dept_grp, :square_feet, :building_id
  validates :instructional_seating_count, presence: true, if: -> {:rmtyp_description == "Classroom" || "Classroom Laboratory"}

  validates_uniqueness_of :rmrecnbr

  # ransack_alias :rooms_with_all_characteristics, :author_first_name_or_author_last_name

  scope :rooms_with_all, -> (params) {
    where(rmrecnbr: RoomCharacteristic.has_all_characteristics(params))
    # joins(:room_characteristics).merge(RoomCharacteristic.contains_all(params))
  }

  scope :bluray_dvd, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.bluray_dvd) }
  scope :chalkboard, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.chalkboard) }
  scope :doccam, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.doccam) }
  scope :interactive_screen, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.interactive_screen) }
  scope :instructor_computer, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.instructor_computer)}
  scope :lecture_capture, ->  {
    joins(:room_characteristics).merge(RoomCharacteristic.lecture_capture) }
  scope :projector_16mm, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.projector_16mm) }
  scope :projector_35mm, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.projector_35mm) }
  scope :projector_digital_cinema, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.projector_digital_cinema) }
  scope :projector_digial, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.projector_digial) }
  scope :projector_slide, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.projector_slide) }
  scope :vcr, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.vcr) }
  scope :video_conf, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.video_conf) }
  scope :whiteboard, -> {
    joins(:room_characteristics).merge(RoomCharacteristic.whiteboard) }

  def self.with_doccam
    joins(:room_characteristics).merge(RoomCharacteristic.doccam)
  end

  def self.classrooms
    where(rmtyp_description: ["Classroom"])
  end

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
    (self.room_characteristics.pluck(:chrstc_descrshort) & ['TeamTables', 'TeamBoard', 'TeamTech']).any?
  end
end
