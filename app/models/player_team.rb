class PlayerTeam < ActiveRecord::Base
  belongs_to :user

  belongs_to :engine
  belongs_to :chasis

  # has_many :drivers as: :driver1
  # has_many :drivers as: :driver2
  
  belongs_to :driver1, class_name: "Driver",
                      foreign_key: "driver_id"

  belongs_to :driver2, class_name: "Driver",
                      foreign_key: "driver_id"

end
