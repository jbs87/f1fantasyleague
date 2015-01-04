module ScoreValueHelper
  def current_score
    score_upto_round(RaceResult.latest_round)
  end

  def current_value
    value_upto_round(RaceResult.latest_round)
  end

  def score_upto_round(rounds)
  	#rounds = RaceResult.last.race_id #need to be changed to work with date
    total = 0

    rounds.times do |round|
      total += score_per_round(round+1)
    end
    return total
  end

  def value_upto_round(rounds)
    #rounds = RaceResult.last.race_id #need to be changed to work with date
    total = price

    rounds.times do |round|
      total += value_per_round(round+1)
    end
    return total
  end
end