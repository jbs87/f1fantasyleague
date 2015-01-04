class ChassisManufacturer < ActiveRecord::Base
  include ScoreValueHelper
  include EngineChassisHelper
  has_many :player_teams
  has_many :race_results
  has_many :races, through: :race_results
  has_many :constructor_markets, foreign_key: "chassis_manufacturers_id"
end

