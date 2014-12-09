class Chasis < ActiveRecord::Base
  has_many :player_teams
  has_many :team_members
end
