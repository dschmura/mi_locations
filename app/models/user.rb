# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  uniqname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
end
