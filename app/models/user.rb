class User < ActiveRecord::Base
	authenticates_with_sorcery!
	validates :password, length: { minimum: 1 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
	validates :email, uniqueness: true

	has_many :player_teams

	def total_score
		testDate = Race.where(round: 1)[0].date+9.hours
		total_score = 0
		pt = player_teams.order(race_id: :desc)
		rounds = whichRound(testDate)
		rounds.times do |round|
			total_score = total_score+ pt[round].primary_driver.score_per_round(round+1)+pt[round].secondary_driver.score_per_round(round+1)+pt[round].chassis_manufacturer.score_per_round(round+1)+pt[round].engine.score_per_round(round+1)
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

	def budget
		testDate = Race.where(round: 2)[0].date+9.hours
		budget = 0
		rounds = whichRound(testDate)
		raceId = Race.find_by(round: 1).id
		for i in 0...rounds
			if(i == 0)
				binding.pry
				budget = 100000000 - player_teams.find_by(race_id: raceId).totalvalue(1)
			else
				budget += player_teams[i].changeBudget
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
end
