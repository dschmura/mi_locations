class CreateRoomCharacteristics < ActiveRecord::Migration[5.2]
  def change
    create_table :room_characteristics do |t|
      t.integer :rmrecnbr
      t.integer :chrstc
      t.integer :chrstc_eff_status
      t.string :chrstc_descrshort
      t.string :chrstc_descr
      t.string :chrstc_desc254
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
