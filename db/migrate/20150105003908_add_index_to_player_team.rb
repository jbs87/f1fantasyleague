class AddIndexToPlayerTeam < ActiveRecord::Migration
  def change
  	add_index :player_teams, :engine_id
  	add_index :player_teams, :chassis_manufacturer_id
  	add_index :player_teams, :driver1_id
  	add_index :player_teams, :driver2_id
  	add_index :player_teams, :race_id
  end
end
