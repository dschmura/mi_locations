# == Schema Information
#
# Table name: alerts
#
#  id             :bigint(8)        not null, primary key
#  severity       :integer          default("info"), not null
#  start_date     :datetime
#  end_date       :datetime
#  alertable_type :string
#  alertable_id   :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Alert < ApplicationRecord
  has_rich_text :message
  belongs_to :alertable, polymorphic: true

  enum severity: [:info, :primary, :success, :warning, :danger]

  validates :severity, presence: true

  def self.active
    where("start_date <= ? AND end_date >= ?", Time.current, Time.current)
  end
end
