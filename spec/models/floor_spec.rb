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

require "rails_helper"

describe Floor do
  let(:building) { build(:building) }

  describe "Valid Floors: " do
    xit "Floor has unique label within a building" do
    end
  end

  describe "InValid Floors" do
    xit "does NOT allow two floors to have the same label within the same building" do
    end
  end
end
