class Driver < ActiveRecord::Base

  has_many :player_teams_as_primary, class_name: "PlayerTeam", source: :primary_driver
  has_many :player_teams_as_secondary, class_name: "PlayerTeam", source: :secondary_driver
  has_many :team_members

  def player_teams
  	PlayerTeam.where("driver1_id = ? or driver2_id = ?", self.id, self.id)
  end

end
