# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  uniqname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { build(:user) }

  describe User do
    describe 'Valid Users' do
      it { should validate_presence_of(:uniqname)
    end
  end

end
