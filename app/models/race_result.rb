class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :engine
  belongs_to :chassis_manufacturer

  def self.latest_round
  	return RaceResult.all.order(race_id: :desc).first.race.round
  end
  
end
