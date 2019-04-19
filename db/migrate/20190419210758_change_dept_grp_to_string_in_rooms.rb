class ChangeDeptGrpToStringInRooms < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :dept_grp, :string
  end
end
