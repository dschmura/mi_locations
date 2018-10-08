class RemoveMessageFromAlerts < ActiveRecord::Migration[5.2]
  def change
    remove_column :alerts, :message
  end
end
