class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uniqname

      t.timestamps
    end
    add_index :users, :uniqname, unique: true
  end
end
