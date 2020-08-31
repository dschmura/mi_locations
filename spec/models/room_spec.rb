# == Schema Information
#
# Table name: rooms
#
#  id                          :bigint           not null, primary key
#  rmrecnbr                    :integer          not null
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

require "rails_helper"

describe Room do
  let(:room) { build(:room) }

  describe "Valid Rooms: " do
    it { should validate_presence_of(:rmrecnbr) }
    # it { should validate_presence_of(:latitude) }
    # it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:floor) }
    it { should validate_presence_of(:room_number) }
    it { should validate_presence_of(:facility_code_heprod) }
    it { should validate_presence_of(:rmtyp_description) }
    it { should validate_presence_of(:dept_id) }
    it { should validate_presence_of(:dept_grp) }
    it { should validate_presence_of(:square_feet) }
    # Rooms that are classrooms should have an instructional_seating_count
    it { should validate_presence_of(:building_id) }
  end

  describe "Room Visability By Role" do
    # A room should only show if it is marked visible
    # Rooms should only appear if they are marked visible
  end

  let(:classroom) { build(:classroom) }

  describe "Valid Classrooms:" do
    it { should validate_presence_of(:instructional_seating_count) }
  end
end
