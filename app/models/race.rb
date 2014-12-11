class Race < ActiveRecord::Base
  belongs_to :track
  has_many :player_teams
  has_many :race_results
end
