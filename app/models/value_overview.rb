class ValueOverview < ActiveRecord::Base
  def self.driver_value_change_for(position)
    # returns the change of value for finishing in a specific position in the race
    ValueOverview.find_by(position: position).driver_race
  end
end
