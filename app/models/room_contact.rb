# == Schema Information
#
# Table name: room_contacts
#
#  id                   :bigint           not null, primary key
#  room_id              :bigint
#  rmrecnbr             :integer
#  rm_schd_cntct_name   :string
#  rm_schd_email        :string
#  rm_schd_cntct_phone  :string
#  rm_det_url           :string
#  rm_usage_guidlns_url :string
#  rm_sppt_deptid       :string
#  rm_sppt_dept_descr   :string
#  rm_sppt_cntct_email  :string
#  rm_sppt_cntct_phone  :string
#  rm_sppt_cntct_url    :string
#

class RoomContact < ApplicationRecord
  belongs_to :room

  validates_presence_of :rmrecnbr
end
