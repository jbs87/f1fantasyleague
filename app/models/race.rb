class Race < ActiveRecord::Base
  belongs_to :track
  has_many :player_teams
  has_many :race_results
  has_many :drivers, through: :race_results
  has_many :engines, through: :race_results
  has_many :chassis_manufacturers, through: :race_results

  # def self.raceDates
  # 	dateArr = []
  # 	Race.all.order(date: :asc).each do |race|
  # 		dateArr.push(race.date)
  # 	end
  # 	return dateArr
  # end

  def self.raceDates
    Race.all.order(date: :asc).map(&:date)
  end


  def self.current_race
    current_round = RaceResult.latest_round + 1
    Race.find_by(round: current_round)
  end

  def self.previous_race
    if RaceResult.any?
      current_round = RaceResult.latest_round
      Race.find_by(round: current_round).id
    else
      return nil
    end
  end

  def daymonth
    date.to_date
  end

  def self.racesWithRaceResults
    # depricated see below, races_with_results
    
    races = []
    Race.all.each do |race|
      if race.race_results[0]
        races.push(race)
      else
        return races
      end
    end

  end

  def self.races_with_results
    current_round = RaceResult.latest_round
    Race.where("round <= ?", current_round)
  end
    
end
