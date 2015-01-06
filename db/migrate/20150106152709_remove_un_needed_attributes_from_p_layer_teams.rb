class RemoveUnNeededAttributesFromPLayerTeams < ActiveRecord::Migration
  def change
    remove_column :player_teams, :driver1_score
    remove_column :player_teams, :driver2_score
    remove_column :player_teams, :engine_score
    remove_column :player_teams, :chassis_score
  end
end
