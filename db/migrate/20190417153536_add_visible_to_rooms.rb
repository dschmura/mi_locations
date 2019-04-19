class AddVisibleToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visible, :boolean, null: false, default: false
  end
end
