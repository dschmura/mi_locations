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
end