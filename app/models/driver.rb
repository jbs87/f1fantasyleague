class Driver < ActiveRecord::Base
  has_many :player_teams #, foreign_key: 'driver1_id'
  has_many :player_teams #, foreign_key: 'driver2_id'
  has_many :team_members
end
