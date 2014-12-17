class Race < ActiveRecord::Base
  belongs_to :track
  has_many :player_teams
  has_many :race_results
  has_many :drivers, through: :race_results
  has_many :engines, through: :race_results
  has_many :chassis_manufacturers, through: :race_results

  def self.raceDates
  	dateArr = []
  	Race.all.order(date: :asc).each do |race|
  		dateArr.push(race.date)
  	end
  	return dateArr
  end

  def self.current_race
    current_round = RaceResult.latest_round + 1
    Race.find_by(round: current_round)
  end

  def daymonth
    date.to_date
  end

end
