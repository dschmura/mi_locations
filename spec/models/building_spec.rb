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

require 'rails_helper'

describe Building do
  let(:building) { build(:building) }

  describe "Valid Buildings: " do
    it { should validate_presence_of(:bldrecnbr) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:country) }

  end

end
