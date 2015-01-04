module EngineChassisHelper
	def score_per_round(round)
		race_id = races.where(round: round)[0].id
		raceresult = race_results.where(race_id: race_id)
		racepos = raceresult[0].race_pos
		qualpos = raceresult[0].qualifying_pos
		racepos1 = raceresult[1].race_pos
		qualpos1 = raceresult[1].qualifying_pos
		ENGINE_Q_SCORE[qualpos-1]+ENGINE_R_SCORE[racepos-1] + ENGINE_Q_SCORE[qualpos1-1]+ENGINE_R_SCORE[racepos1-1]
  		# qualpoints = ScoringOverview.find_by_position(qualpos).chassis_qual
  		# racepoints = ScoringOverview.find_by_position(racepos).chassis_race
  		# qualpoints1 = ScoringOverview.find_by_position(qualpos1).chassis_qual
  		# racepoints1 = ScoringOverview.find_by_position(racepos1).chassis_race
  	end


  	def value_per_round(round)
  		race_id = races.where(round: round)[0].id
  		raceresult = race_results.where(race_id: race_id)
  		racepos = raceresult[0].race_pos
  		racepos1 = raceresult[1].race_pos
  		ENGINE_VALUE[racepos-1]+ ENGINE_VALUE[racepos1-1]
	# racevalue = ValueOverview.find_by_position(racepos).chassis_race
	# racevalue1 = ValueOverview.find_by_position(racepos1).chassis_race
end
end