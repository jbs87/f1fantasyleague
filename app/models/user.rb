class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :player_teams

  def total_score
  	rounds = 0
  	dateArr = Race.raceDates
  	testDate = Race.where(round: 4)[0].date+9.hours
  	dateArr.each_with_index do |date, index| 
  		if (testDate > date)
  			rounds = index+1
  		end
  	end
  	total_score = 0
  	self.player_teams.each do |playerteam|
  		total_score += playerteam.totalscore(rounds)
  	end
  	return total_score
  end
end
