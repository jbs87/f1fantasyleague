class Driver < ActiveRecord::Base

  has_many :player_teams_as_primary, class_name: "PlayerTeam", foreign_key: 'driver1_id'
  has_many :player_teams_as_secondary, class_name: "PlayerTeam", foreign_key: 'driver2_id'
  has_many :team_members

  def player_teams
  	PlayerTeam.where("driver1_id = ? or driver2_id = ?", self.id, self.id)
  end

  def score
  	rwt = TeamMember.where("driver_id = ?", self.id)
  	pos = RaceResult.where("qualifying_pos = ?", rwt)
  end

end
