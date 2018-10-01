class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.integer :severity, default: 0, null: false
      t.string :message
      t.datetime :start_date
      t.datetime :end_date
      t.references :alertable, polymorphic: true

      t.timestamps
    end
    add_index :alerts, [:alertable_id, :alertable_type]
  end
end
