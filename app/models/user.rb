class User < ActiveRecord::Base
	authenticates_with_sorcery!
	validates :password, length: { minimum: 1 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
	validates :email, uniqueness: true

	has_many :player_teams
	has_many :friendships
	# has_many :friends, through: :friendships, condition: "stats='accepted'"
	# has_many :requested_friends, through: :friendships, source: :friend, condition: "stats='requested'"
	# has_many :pending_friends, through: :friendships, source: :friend, condition: "stats='pending'"
	has_many :friends, -> { (where  "friendships.status = 'accepted'").order(name: :desc) }, through: :friendships 
	has_many :requested_friends, -> { (where  "friendships.status = 'requested'").order(name: :desc) }, through: :friendships, source: :friend
	has_many :pending_friends, -> { (where  "friendships.status = 'pending'").order(name: :desc) }, through: :friendships  ,source: :friend


	after_save :create_default_player_team, on: [ :create ]

	def score
		current_round = RaceResult.latest_round
		# if current_round == 0
		# 	current_round = 1
		# end
		
		race_id = Race.find_by(round: current_round+1).id
		score = player_teams.where(race_id: race_id).last.score
	end

	def budget
		current_round = RaceResult.latest_round
		# if current_round == 0
		# 	current_round = 1
		# end

		race_id = Race.find_by(round: current_round+1)
		budget = player_teams.where(race_id: race_id).last.budget
	end

	def current_score
		total_score(RaceResult.latest_round)
	end

	def current_budget
		budget_v1(RaceResult.latest_round)
	end

	def total_score(rounds)
		total_score = 0
		pt = player_teams.order(race_id: :asc)
		rounds.times do |round|
			total_score += pt[round].primary_driver.score_per_round(round+1)+pt[round].secondary_driver.score_per_round(round+1)+pt[round].chassis_manufacturer.score_per_round(round+1)+pt[round].engine.score_per_round(round+1)
		end
		return total_score
	end

	def total_value
		testDate = Race.where(round: 2)[0].date+9.hours
		total_value = 0
		rounds = whichRound(testDate)
		self.player_teams.each do |playerteam|
			total_value += playerteam.totalvalue(rounds)
		end
		return total_value
	end

	def whichRound(currDate)
		rounds = 0
		dateArr = Race.raceDates
		dateArr.each_with_index do |date, index| 
			if (currDate > date)
				rounds = index+1
			end
		end
		return rounds
	end

	def budget_v1(rounds)
		# binding.pry
		# testDate = Race.where(round:)[0].date+9.hours
		budget = 100000000
		temp = 0
		# rounds = whichRound(testDate)
		# binding.pry
		raceId = Race.find_by(round: 1).id
		for i in 0...rounds+1
			if(i == 0)
				budget -= player_teams.find_by(race_id: raceId).initTeamPrice
			else
				temp = (player_teams[i].primary_driver.score_per_round(i)+player_teams[i].secondary_driver.score_per_round(i)+player_teams[i].chassis_manufacturer.score_per_round(i)+player_teams[i].engine.score_per_round(i))*50000
				# binding.pry
				budget += player_teams[i].changeBudget + temp
				# +(player_teams[i].primary_driver.score_per_round(i)+player_teams[i].secondary_driver.score_per_round(i)+player_teams[i].chassis_manufacturer.score_per_round(i)+player_teams[i].engine.score_per_round(i))*50000
			end
		end
		return budget
	end

	def playerTeamChanged(currentTeam,newTeam)
		if currentTeam.attributes.except('id','created_at','updated_at') == newTeam.attributes.except('id','created_at','updated_at')
			return false
		else
			return true
		end
	end

	def create_default_player_team
		# TODO:
		# If we want User Registration after the season has begun,
		# then a default player_team needs to be created for that
		# user for every round up to to and including current round.
		#
		latest_round = RaceResult.latest_round + 1

		(1..latest_round).each do |round|

	    primary_driver   = Driver.find_by(name: 'Max Chilton')
	    secondary_driver = Driver.find_by(name: 'Marcus Ericsson')
	    constructor      = ChassisManufacturer.find_by(name: 'Sauber F1 Team')
	    engine           = Engine.find_by(name: 'Lotus - Renault')

	    # race_id          = Race.current_race.id
	    race_id          = Race.find_by(round: round).id
	    
	    starting_score = 0
	    starting_budget = 14_000_000  # 100M - team_value which is 86M
	    # starting_budget = 64_000_000  # 100M - team_value which is 86M

	    default_team = player_teams.build({ driver1_id: primary_driver.id,
	    	                    driver2_id: secondary_driver.id,
	    	                    engine_id: engine.id,
	    	                    chassis_manufacturer_id: constructor.id,
	    	                    race_id: race_id,
	    	                    score: starting_score,
	    	                    budget: starting_budget})
	    default_team.save(validate: false)
	  end
	end

end
