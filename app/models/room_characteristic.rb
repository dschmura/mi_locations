# == Schema Information
#
# Table name: room_characteristics
#
#  id                :bigint           not null, primary key
#  rmrecnbr          :integer
#  chrstc            :integer
#  chrstc_eff_status :integer
#  chrstc_descrshort :string
#  chrstc_descr      :string
#  chrstc_desc254    :string
#  room_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class RoomCharacteristic < ApplicationRecord
  belongs_to :room
  validates_presence_of :rmrecnbr

  scope :matches_params, ->  (params) {
    where(chrstc_descrshort: params ).pluck(:rmrecnbr)
  }

  scope :has_all_characteristics, -> (params) {
    rooms = self.matches_params(params)
    number_of_params = params.size
    number_of_params.times { |iteration| rooms = rooms & rooms}
    # puts "REPORT:: #{rooms}"
    puts "REPORT: unique: #{rooms.uniq.count} | total: #{rooms.count}"
    rooms

  }

  scope :bluray_dvd, -> {
    where(chrstc_descrshort: ["BluRay/DVD", "BluRay"]) }
  scope :chalkboard, -> {
    where(chrstc_descrshort: ["Chkbrd>25", "Chkbrd"]) }
  scope :doccam, -> {
    where(chrstc_descrshort: ["DocCam"]) }
  scope :interactive_screen, -> {
    where(chrstc_descrshort: ["IntrScreen"]) }
  scope :instructor_computer, -> {
    where(chrstc_descrshort: ["InstrComp", "CompPodPC", "CompPodMac"]) }
  scope :lecture_capture, ->  {
    where(chrstc_descrshort: ["LectureCap"]) }
  scope :projector_16mm, -> {
    where( chrstc_descrshort: ["Proj16mm"]) }
  scope :projector_35mm, -> {
    where( chrstc_descrshort: ["Proj35mm"]) }
  scope :projector_digital_cinema, -> {
    where( chrstc_descrshort: ["ProjD-Cin"]) }
  scope :projector_digial, -> {
    where( chrstc_descrshort: ["ProjDigit"]) }
  scope :projector_slide, -> {
    where( chrstc_descrshort: ["ProjSlide"]) }
  scope :vcr, -> {
    where(chrstc_descrshort: ["VCR"]) }
  scope :video_conf, -> {
     where(chrstc_descrshort: ["VideoConf"]) }
  scope :whiteboard, -> {
    where(chrstc_descrshort: ["Whtbrd>25", "Whtbrd"]) }
end
