class PlayerTeam < ActiveRecord::Base
  belongs_to :user

  belongs_to :engine
  belongs_to :chasis
  
  # note
  # belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  # is the same as
  # belongs_to :user
  
  belongs_to :primary_driver, class_name: "Driver", foreign_key: "driver1_id"
  belongs_to :secondary_driver, class_name: "Driver", foreign_key: "driver2_id"

end
