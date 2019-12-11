class AddCharacteristicsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :characteristics, :text, array: true, default: []
  end
end
