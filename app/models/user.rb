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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
