class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :bldrecnbr
      t.float :latitude
      t.float :longitude
      t.string :name, null: false
      t.string :nick_name, null: false
      t.string :abbreviation
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :country, null: false

      t.timestamps
    end
    add_index :buildings, :bldrecnbr, unique: true
    add_index :buildings, :name
    add_index :buildings, :nick_name
    add_index :buildings, :abbreviation
  end
end
