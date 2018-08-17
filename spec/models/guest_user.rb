require 'rails_helper'

RSpec.describe GuestUser, type: :model do
let(:guest_user) { build(:guest_user) }

  describe User do
    describe 'Valid Guest Users' do
      it { should validate_presence_of(:uniqname)
    end
  end

end
