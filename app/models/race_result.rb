class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :engine
  belongs_to :chassis_manufacturer

  after_create :update_driver_market

  def self.latest_round
    # this does not work until there is a race recorded!!
    if RaceResult.all.empty?
      round = 0
    else
    	round = RaceResult.all.order(race_id: :desc).first.race.round
    end
    round
  end

  private

    def update_driver_market

      # after a race result is saved the driver market for the same round needs to be updated.
      round = Race.find_by(id: race_id).round
      driver_market = driver.driver_markets.find_or_initialize_by(round: round)
      previous_round_score = driver.driver_markets.where(round: (round-1)).last.score
      driver_market.score = previous_round_score + ScoringOverview.race_points_for(race_pos) + 
                            ScoringOverview.qualifying_points_for(qualifying_pos)
      driver_market.value = driver.driver_markets.where(round: (round-1) ).last.value +
                            ValueOverview.driver_value_change_for(race_pos)
      driver_market.save

      # TODO: the engine and chassis manufacturer score and value need updating here.
      constructor_market = chassis_manufacturer.constructor_markets.find_or_initialize_by(round: round)
      constructor_previous_round_score = chassis_manufacturer.constructor_markets.where(round: (round-1)).last.score
      constructor_market.score = constructor_previous_round_score + ScoringOverview.constructor_race_points_for(race_pos) +
                                 ScoringOverview.constructor_qualifying_points_for(qualifying_pos)
      constructor_market.value = chassis_manufacturer.constructor_markets.where(round: (round-1) ).last.value +
                                 ValueOverview.constructor_value_change_for(race_pos)
      constructor_market.save

    end
  
end
