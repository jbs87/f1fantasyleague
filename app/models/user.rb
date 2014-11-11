class User < ActiveRecord::Base
  has_many :player_teams

  has_secure_password

end
