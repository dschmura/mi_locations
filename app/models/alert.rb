# == Schema Information
#
# Table name: alerts
#
#  id             :bigint(8)        not null, primary key
#  severity       :integer          default(0), not null
#  message        :string
#  start_date     :datetime
#  end_date       :datetime
#  alertable_type :string
#  alertable_id   :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Alert < ApplicationRecord

  belongs_to :alertable, polymorphic: true

  enum severity:  [ :info, :primary, :success, :warning, :danger]

  validates :severity, :message, presence: true

  def self.active
    where('start_date <= ? AND end_date >= ?', Time.current, Time.current)
  end
  
end