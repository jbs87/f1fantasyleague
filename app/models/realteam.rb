class Realteam < ActiveRecord::Base

  belongs_to :engine
  belongs_to :chassis_manufacturer
  
  belongs_to :primary_driver, class_name: "Driver", foreign_key: "driver1_id"
  belongs_to :secondary_driver, class_name: "Driver", foreign_key: "driver2_id"

	def self.isValidTeam(pt)
		if self.find_by(driver1_id: pt.primary_driver.id, driver2_id: pt.secondary_driver.id)
			return false
		end
		if self.find_by(engine_id: pt.engine.id, chassis_manufacturer_id: pt.chassis_manufacturer.id)
			return false
		end
		if self.find_by(driver1_id: pt.primary_driver.id, chassis_manufacturer_id: pt.chassis_manufacturer.id)
			return false
		end
		if self.find_by(driver1_id: pt.primary_driver.id, engine_id: pt.engine.id)
			return false
		end
		if self.find_by(driver2_id: pt.secondary_driver.id, chassis_manufacturer_id: pt.chassis_manufacturer.id)
			return false
		end
		if self.find_by(driver2_id: pt.secondary_driver.id, engine_id: pt.engine.id)
			return false
		end
		return true
	end
end
