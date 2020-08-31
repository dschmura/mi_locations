class RemoveLatituteAndLongitudeFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :latitude, :string
    remove_column :rooms, :longitude, :string
  end
end
