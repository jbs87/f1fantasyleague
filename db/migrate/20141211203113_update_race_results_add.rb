class UpdateRaceResultsAdd < ActiveRecord::Migration
  def change
  	add_column :race_results, :driver_id, :integer
  	add_column :race_results, :chassis_manufacturer_id, :integer
  	add_column :race_results, :engine_id, :integer
  end
end
