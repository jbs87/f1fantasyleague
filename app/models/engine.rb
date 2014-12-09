class Engine < ActiveRecord::Base
    has_many :player_teams
    has_many :team_members
end
