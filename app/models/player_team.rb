class PlayerTeam < ActiveRecord::Base
  belongs_to :user

  belongs_to :engine
  belongs_to :chassis_manufacturer
  
  # note
  # belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  # is the same as
  # belongs_to :user
  
  belongs_to :primary_driver, class_name: "Driver", foreign_key: "driver1_id"
  belongs_to :secondary_driver, class_name: "Driver", foreign_key: "driver2_id"

  belongs_to :race

  def d1score(rounds)
  	primary_driver.score_upto_round(rounds)
  end

  def d2score(rounds)
  	secondary_driver.score_upto_round(rounds)
  end

  def d1value(rounds)
    primary_driver.value_upto_round(rounds)
  end

  def d2value(rounds)
    secondary_driver.value_upto_round(rounds)
  end

  def totalscore(rounds)
  	# binding.pry
  	score = d1score(rounds) + d2score(rounds) + engine.score_upto_round(rounds) 
    + chassis_manufacturer.score_upto_round(rounds)
    return score
  end

   def totalvalue(rounds)
    # binding.pry
    value = d1value(rounds) + d2value(rounds) + engine.value_upto_round(rounds) 
    + chassis_manufacturer.value_upto_round(rounds)
    return value
  end

  def changeBudget
    netChange = 0
    round = race.round
    previousraceId = Race.find_by(round: round-1).id
    currentTeam = PlayerTeam.where(race_id: previousraceId, user_id: user_id)[0]
    netChange += (primary_driver.value_upto_round(round)-currentTeam.primary_driver.value_upto_round(round))
    netChange += (secondary_driver.value_upto_round(round)-currentTeam.secondary_driver.value_upto_round(round))
    netChange += (chassis_manufacturer.value_upto_round(round)-currentTeam.chassis_manufacturer.value_upto_round(round))
    netChange += (engine.value_upto_round(round)-currentTeam.engine.value_upto_round(round))
    return (netChange*-1)
  end

  def updateable?
    # race.date.36.hours.from.now > Time.now
    # race.qualifying_date > Time.now
    # race.race_results.blank?
    return true
  end

end
