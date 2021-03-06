# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  uniqname               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  provider               :string
#  uid                    :string
#  avatar_url             :string
#  mcommunity_groups      :text             default(""), not null
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe User do
    describe "Valid Users" do
      it { should validate_presence_of(:uniqname) }
    end
  end
end
