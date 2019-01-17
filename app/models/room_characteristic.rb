# == Schema Information
#
# Table name: room_characteristics
#
#  id                :bigint(8)        not null, primary key
#  rmrecnbr          :integer
#  chrstc            :integer
#  chrstc_eff_status :integer
#  chrstc_descrshort :string
#  chrstc_descr      :string
#  chrstc_desc254    :string
#  room_id           :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'csv'

class RoomCharacteristic < ApplicationRecord

  belongs_to :room

  validates_presence_of :rmrecnbr

  def self.to_csv

    attributes = %w{ rmrecnbr chrstc chrstc_eff_status  chrstc_descrshort chrstc_descr chrstc_desc254 room_id}

    CSV.generate(headers: true) do |csv|
    
      csv << attributes

      all.each do |room_char|
        csv << attributes.map{ |attr| room_char.send(attr) }
      end
    end
  end

end
