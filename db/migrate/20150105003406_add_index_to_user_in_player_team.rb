class AddIndexToUserInPlayerTeam < ActiveRecord::Migration
  def change
  	add_index :player_teams, :user_id
  end
end
