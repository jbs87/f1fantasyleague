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

  validates :user_id, :driver1_id, :driver2_id, :engine_id,
            :chassis_manufacturer_id, :race_id, presence: true
  validate :valid_team_selection
  validate :budget_needs_to_be_positive

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
    currentTeam = PlayerTeam.find_by(race_id: previousraceId, user_id: user_id)
    netChange += (primary_driver.value_upto_round(round-1)-currentTeam.primary_driver.value_upto_round(round-1))
    netChange += (secondary_driver.value_upto_round(round-1)-currentTeam.secondary_driver.value_upto_round(round-1))
    netChange += (chassis_manufacturer.value_upto_round(round-1)-currentTeam.chassis_manufacturer.value_upto_round(round-1))
    netChange += (engine.value_upto_round(round-1)-currentTeam.engine.value_upto_round(round-1))
    return (netChange*-1)
  end

   def checkBudget
    netChange = 0
    round = race.round
    raceId = Race.find_by(round: round).id
    currentTeam = PlayerTeam.find_by(race_id: raceId, user_id: user_id)
    netChange += (primary_driver.value_upto_round(round-1)-currentTeam.primary_driver.value_upto_round(round-1))
    netChange += (secondary_driver.value_upto_round(round-1)-currentTeam.secondary_driver.value_upto_round(round-1))
    netChange += (chassis_manufacturer.value_upto_round(round-1)-currentTeam.chassis_manufacturer.value_upto_round(round-1))
    netChange += (engine.value_upto_round(round-1)-currentTeam.engine.value_upto_round(round-1))
    return (netChange*-1)
  end

  def updateable?
    # race.date.36.hours.from.now > Time.now
    # race.qualifying_date > Time.now
    # race.race_results.blank?
    return true
  end

  def initTeamPrice
    return (primary_driver.price + secondary_driver.price + engine.price + chassis_manufacturer.price)
  end

   def valid_team_selection
    if !Realteam.isValidTeam(self)
      errors.add(:driver1_id, "Driver 1 can't be Team mate")
    end
  end

  def budget_needs_to_be_positive
    # binding.pry
    if (user.current_budget + checkBudget)<0
      errors.add(:budget, "You don't have enough budget")
    end
  end

end
