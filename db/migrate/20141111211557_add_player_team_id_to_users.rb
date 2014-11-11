class AddPlayerTeamIdToUsers < ActiveRecord::Migration
  def change 
    add_column :users, :playerteam_id, :integer
  end
end
