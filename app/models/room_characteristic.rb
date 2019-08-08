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
end
