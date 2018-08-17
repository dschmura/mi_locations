require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { build(:user) }

  describe User do
    describe 'Valid Users' do
      it { should validate_presence_of(:uniqname)
    end
  end

end
