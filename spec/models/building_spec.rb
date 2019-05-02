# == Schema Information
#
# Table name: buildings
#
#  id           :bigint(8)        not null, primary key
#  bldrecnbr    :integer
#  latitude     :float
#  longitude    :float
#  name         :string           not null
#  nick_name    :string           not null
#  abbreviation :string
#  address      :string           not null
#  city         :string           not null
#  state        :string           not null
#  zip          :string           not null
#  country      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "rails_helper"

describe Building do
  let(:building) { build(:building) }

  describe "Valid Buildings: " do
    # it { should validate_presence_of(:bldrecnbr) }
    # it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:address) }
    # it { should validate_presence_of(:city) }
    # it { should validate_presence_of(:state) }
    # it { should validate_presence_of(:zip) }
    # it { should validate_presence_of(:country) }
    it "validates presence of  :bldrecnbr" do
      building = build(:building, bldrecnbr: nil)
      building.valid?
      expect(building.errors[:bldrecnbr].any?).to eq(true)
    end

    it "validates presence of  :name" do
      building = build(:building, name: "")
      building.valid?
      expect(building.errors[:name].any?).to eq(true)
    end

    it "validates presence of  :address" do
      building = build(:building, address: "")
      building.valid?
      expect(building.errors[:address].any?).to eq(true)
    end

    it "validates presence of  :city" do
      building = build(:building, city: "")
      building.valid?
      expect(building.errors[:city].any?).to eq(true)
    end

    it "validates presence of  :state" do
      building = build(:building, state: "")
      building.valid?
      expect(building.errors[:state].any?).to eq(true)
    end

    it "validates presence of  :zip" do
      building = build(:building, zip: "")
      building.valid?
      expect(building.errors[:zip].any?).to eq(true)
    end

    it "validates presence of  :country" do
      building = build(:building, country: "")
      building.valid?
      expect(building.errors[:country].any?).to eq(true)
    end
  end
end
