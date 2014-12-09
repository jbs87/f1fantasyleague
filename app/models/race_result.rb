class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :team_member
end
