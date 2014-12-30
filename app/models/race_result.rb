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

      driver_market = driver.driver_markets.where(round: round).first_or_initialize

      previous_round_score = driver.driver_markets.where(round: (round-1)).last.score
      driver_market.score = previous_round_score + ScoringOverview.race_points_for(race_pos) + 
                            ScoringOverview.qualifying_points_for(qualifying_pos)
      driver_market.value = driver.driver_markets.where(round: (round-1) ).last.value +
                            ValueOverview.driver_value_change_for(race_pos)
      driver_market.save

      # TODO: if there is already a constructor_market.score , that means that we are updating the
      #       score with the 2nd driver. in that case add the 2nd drivers score to waht is already
      #       there from the 1st. Also don't check previous round score again.

      constructor_market = chassis_manufacturer.constructor_markets.where(round: round).first_or_initialize

      if constructor_market.score
          # if score not nil, then this is the second time for this round
        constructor_market.score = constructor_market.score + ScoringOverview.constructor_race_points_for(race_pos) +
                                   ScoringOverview.constructor_qualifying_points_for(qualifying_pos)
        constructor_market.value = constructor_market.value + ValueOverview.constructor_value_change_for(race_pos)

      else
        # first time for this round
        previous_round_score = chassis_manufacturer.constructor_markets.where(round: (round-1)).last.score
        constructor_market.score = previous_round_score + ScoringOverview.constructor_race_points_for(race_pos) +
                                   ScoringOverview.constructor_qualifying_points_for(qualifying_pos)

        previous_round_value     = chassis_manufacturer.constructor_markets.where(round: (round-1) ).last.value
        constructor_market.value = previous_round_value + ValueOverview.constructor_value_change_for(race_pos)
      end

      constructor_market.save

    end
  
end
