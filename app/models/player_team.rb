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


  def self.update_after_new_race_results
    # Call this method after all race results have been entered for a round.
    # This method updates all player teams

    # Need to guard against running this method more than once per round.

    # find all PlayerTeam for the last round. (move code from rake task that does this)
    # Duplicate them.
    # Adjust score and budget according to game rules.

    latest_round = RaceResult.latest_round
    # binding.pry
    # return if latest_round < 1
    for_race_id  = Race.find_by(round: latest_round).id
    teams = PlayerTeam.where(race_id: for_race_id)
    
    next_race_id = Race.find_by(round: latest_round+1).id

    teams.each do |team|
      new_team = team.dup
      new_team.race_id = next_race_id
      # binding.pry
      # total_score = new_team.primary_driver.score_per_round(round+1)+pt[round].secondary_driver.score_per_round(round+1)+pt[round].chassis_manufacturer.score_per_round(round+1)+pt[round].engine.score_per_round(round+1)
      total_score =  new_team.primary_driver.score_per_round(latest_round)
      total_score += new_team.secondary_driver.score_per_round(latest_round)
      total_score += new_team.engine.score_per_round(latest_round)
      total_score += new_team.chassis_manufacturer.score_per_round(latest_round)

      # update score and budget
      total_budget = total_score * 50_000

      new_team.budget += total_budget
      new_team.score  += total_score


      if !new_team.save(validate: false)
        puts "There was an error cloning Player team with id: #{team.id}"
      end
          
    end

  end

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
  	score = d1score(rounds) + d2score(rounds) + engine.score_upto_round(rounds) 
    + chassis_manufacturer.score_upto_round(rounds)
    return score
  end

   def totalvalue(rounds)
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

  def change_team(player_team_params)

    net_worth = budget
    net_worth += DriverMarket.find_by(id: driver1_id).value
    net_worth += DriverMarket.find_by(id: driver2_id).value
    net_worth += ConstructorMarket.find_by(id: chassis_manufacturer_id).value
    net_worth += ConstructorMarket.find_by(id: engine_id).value
    
    update_attributes(player_team_params)

    new_budget = net_worth
    new_budget -= DriverMarket.find_by(id: driver1_id).value
    new_budget -= DriverMarket.find_by(id: driver2_id).value
    new_budget -= ConstructorMarket.find_by(id: chassis_manufacturer_id).value
    new_budget -= ConstructorMarket.find_by(id: engine_id).value

    update_attributes({budget: new_budget})

  end

end
