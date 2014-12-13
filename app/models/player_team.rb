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

  def totalscore(rounds)
  	# binding.pry
  	score = d1score(rounds) + d2score(rounds) + engine.score_upto_round(rounds) 
    + chassis_manufacturer.score_upto_round(rounds)
    return score
  end

end
