class AddMCommunityGroupsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mcommunity_groups, :text
  end
end
