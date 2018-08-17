class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :rmrecnbr, null: false
      t.float :latitude
      t.float :longitude
      t.string :floor, null: false
      t.string :room_number, null: false
      t.string :facility_code_heprod, null: false
      t.string :rmtyp_description
      t.integer :dept_id
      t.integer :dept_grp
      t.integer :square_feet
      t.integer :instructional_seating_count
      t.references :building, foreign_key: true

      t.timestamps
    end
    add_index :rooms, :rmrecnbr, unique: true
    add_index :rooms, :facility_code_heprod
  end
end
