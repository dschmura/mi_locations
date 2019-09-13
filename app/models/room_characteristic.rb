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

  def self.has_all_characteristics(params)
    rmrecnbrs = self.matches_params(params)
    result = []
    rmrecnbrs.uniq.each do |rmrecnbr|
      if rmrecnbrs.count(rmrecnbr) == params.count
        result << rmrecnbr
      end
    end
    result
  end

  # scope :has_all_characteristics, -> (params) {
  #   rmrecnbrs = self.matches_params(params)
  #   result = []
  #   rmrecnbrs.uniq.each do |rmrecnbr|
  #     if rmrecnbrs.count(rmrecnbr) == params.count
  #       result << rmrecnbr
  #     end
  #   end
  # }

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


  def feature?
    amenities = [ "AssistLis", "Blackout", "DocCam", "Ethernet", "EthrStud", "IntrScreen", "LectureCap", "VideoConf", "VCR"]
    if amenities.include?(self.chrstc_descrshort)
      self
    end
  end

  def chalkboard_feature?
    chalkboards = [ "Chkbrd", "Chkbrd>25"]
    if chalkboards.include?(self.chrstc_descrshort)
      self
    end
  end

  def chalkboard_feature?
    chalkboards = [ "Chkbrd", "Chkbrd>25"]
    if chalkboards.include?(self.chrstc_descrshort)
      self
    end
  end

  def instructor_computer?
    amenities = [ "InstrComp", "CompPodPC", "CompPodMac"]
    if amenities.include?(self.chrstc_descrshort)
      self
    end
  end

  def ethernet?
    ethernet = ["Proj16mm", "Proj35mm", "ProjD-Cin", "ProjDigit", "ProjSlide"]
    if ethernet.include?(self.chrstc_descrshort)
      
    end
  end

  def projection_feature?
    projectors = ["Proj16mm", "Proj35mm", "ProjD-Cin", "ProjDigit", "ProjSlide"]
    if projectors.include?(self.chrstc_descrshort)
      self
    end
  end


  def whiteboard_feature?
    whiteboards = [ "Whtbrd", "Whtbrd>25"]
    if whiteboards.include?(self.chrstc_descrshort)
      self
    end
  end
end
