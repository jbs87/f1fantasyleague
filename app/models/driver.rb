class Driver < ActiveRecord::Base
  include ScoreValueHelper
	has_many :player_teams_as_primary, class_name: "PlayerTeam", foreign_key: 'driver1_id'
	has_many :player_teams_as_secondary, class_name: "PlayerTeam", foreign_key: 'driver2_id'
	has_many :realteams_as_primary, class_name: "Realteam", foreign_key: 'driver1_id'
  has_many :realteams_as_secondary, class_name: "Realteam", foreign_key: 'driver2_id'
  has_many :race_results
  has_many :driver_markets
  has_many :races, through: :race_results

  def score_per_round(round)
    race_id = races.where(round: round)[0].id
    raceresult = race_results.find_by(race_id: race_id)
    racepos = raceresult.race_pos
    qualpos = raceresult.qualifying_pos
    DRIVER_Q_SCORE[qualpos-1]+DRIVER_R_SCORE[racepos-1]
    # qualpoints = ScoringOverview.find_by_position(qualpos).driver_qual
    # racepoints = ScoringOverview.find_by_position(racepos).driver_race
  end

  def value_per_round(round)
    race_id = races.where(round: round)[0].id
    racepos = race_results.find_by(race_id: race_id).race_pos
    DRIVER_VALUE[racepos-1]
    # racevalue = ValueOverview.find_by_position(racepos).driver_race
  end


end
