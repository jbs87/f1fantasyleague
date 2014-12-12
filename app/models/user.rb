class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :player_teams

  def total_score
  	total_score = 0
  	self.player_teams.each do |playerteam|
  		total_score += playerteam.totalscore
  	end
  	return total_score
  end
end
