class TeamMember < ActiveRecord::Base
  has_many :race_results
  belongs_to :driver
  belongs_to :engine
  belongs_to :chasis
  belongs_to :race
end
