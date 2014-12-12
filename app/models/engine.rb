class Engine < ActiveRecord::Base
	has_many :player_teams
	has_many :race_results
	has_many :races, through: :race_results

	def score_upto_round
  		rounds = RaceResult.last.race_id #need to be changed to work with date
  		total = 0

  		rounds.times do |round|
  			total += score_per_round(round+1)
  		end
  		return total
  	end

  	def score_per_round(round)
  		race_id = races.where(round: round)[0].id
  		racepos = race_results.where(race_id: race_id)[0].race_pos
  		qualpos = race_results.where(race_id: race_id)[0].qualifying_pos
  		racepos1 = race_results.where(race_id: race_id)[1].race_pos
  		qualpos1 = race_results.where(race_id: race_id)[1].qualifying_pos
  		qualpoints = ScoringOverview.find_by_position(qualpos).chassis_qual
  		racepoints = ScoringOverview.find_by_position(racepos).chassis_race
  		qualpoints1 = ScoringOverview.find_by_position(qualpos1).chassis_qual
  		racepoints1 = ScoringOverview.find_by_position(racepos1).chassis_race
  		return qualpoints + racepoints + qualpoints1 + racepoints1
  		binding.pry
  	end

  end



