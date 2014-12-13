class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :engine
  belongs_to :chassis_manufacturer

  
end
