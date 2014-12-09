class RenameChassisColumns < ActiveRecord::Migration
  def change
    rename_column :player_teams, :chasis_id, :chassis_manufacturer_id
    rename_column :team_members, :chassis_id, :chassis_manufacturer_id
  end
end
