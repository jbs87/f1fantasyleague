class RemovePlayerTeamIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :player_team_id
  end
end
