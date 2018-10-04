

require 'rails_helper'

describe Alert do
  let(:alert) { build(:alert) }

  describe "Valid Alerts: " do
    it { is_expected.to have_db_column(:alertable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:alertable_type).of_type(:string) }
    it { is_expected.to belong_to(:alertable) }
    it { should validate_presence_of(:severity) }
    it { should validate_presence_of(:message) }

  end

end
