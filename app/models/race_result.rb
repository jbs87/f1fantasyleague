class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :engine
  belongs_to :chassis_manufacturer

  def self.latest_round
    # this does not work until there is a race recorded!!
    if RaceResult.all.empty?
      round = 0
    else
    	round = RaceResult.all.order(race_id: :desc).first.race.round
    end
    round
  end
  
end
