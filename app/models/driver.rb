class Driver < ActiveRecord::Base

	has_many :player_teams_as_primary, class_name: "PlayerTeam", foreign_key: 'driver1_id'
	has_many :player_teams_as_secondary, class_name: "PlayerTeam", foreign_key: 'driver2_id'
	has_many :race_results

	def player_teams
		PlayerTeam.where("driver1_id = ? or driver2_id = ?", self.id, self.id)
	end

	def score
  	rounds = RaceResult.last.race_id #need to be changed to work with date
  	total = 0
  	rounds.times do |round|
  		rwt = TeamMember.where("driver_id = ?", self.id)[round]
  		racepos = RaceResult.where("team_member_id = ?", rwt.id)[0].race_pos
  		qualpos = RaceResult.where("team_member_id = ?", rwt.id)[0].qualifying_pos
  		qualpoints = ScoringOverview.where("position = ?", qualpos)[0].driver_qual
  		racepoints = ScoringOverview.where("position = ?", racepos)[0].driver_race
  		total = total + qualpoints + racepoints
  	end
  	return total
  end

end
