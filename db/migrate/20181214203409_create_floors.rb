class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.string :label
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
