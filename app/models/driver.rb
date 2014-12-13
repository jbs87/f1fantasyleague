class Driver < ActiveRecord::Base

	has_many :player_teams_as_primary, class_name: "PlayerTeam", foreign_key: 'driver1_id'
	has_many :player_teams_as_secondary, class_name: "PlayerTeam", foreign_key: 'driver2_id'
	has_many :race_results
  has_many :races, through: :race_results

	def player_teams
		PlayerTeam.where("driver1_id = ? or driver2_id = ?", self.id, self.id)
	end

	def score_upto_round(rounds)
  	#rounds = RaceResult.last.race_id #need to be changed to work with date
    total = 0

  	rounds.times do |round|
  		total += score_per_round(round+1)
  	end
  	return total
  end

  def score_per_round(round)
    race_id = races.where(round: round)[0].id
    racepos = race_results.find_by(race_id: race_id).race_pos
    qualpos = race_results.find_by(race_id: race_id).qualifying_pos
    qualpoints = ScoringOverview.find_by_position(qualpos).driver_qual
    racepoints = ScoringOverview.find_by_position(racepos).driver_race
    return qualpoints + racepoints
  end

end
