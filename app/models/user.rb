class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :player_teams

  has_secure_password

end
