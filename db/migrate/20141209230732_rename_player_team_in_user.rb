class RenamePlayerTeamInUser < ActiveRecord::Migration
  def change
    rename_column :users, :playerteam_id, :player_team_id
  end
end
