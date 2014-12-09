class AddRaceScoreToPlayerTeam < ActiveRecord::Migration
  def change
  	add_column :player_teams, :race_id, :integer
  	add_column :player_teams, :driver1_score, :integer
  	add_column :player_teams, :driver2_score, :integer
  	add_column :player_teams, :engine_score, :integer
  	add_column :player_teams, :chassis_score, :integer
  end
end
