class AddIndexToRaceResults < ActiveRecord::Migration
  def change
  	add_index :race_results, :race_id
  	add_index :race_results, :driver_id
  	add_index :race_results, :engine_id
  	add_index :race_results, :chassis_manufacturer_id
  	add_index :races, :track_id
  	add_index :realteams, :engine_id
  	add_index :realteams, :chassis_manufacturer_id
  end
end
