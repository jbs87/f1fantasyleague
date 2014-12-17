class Realteam < ActiveRecord::Base

	def self.isValidTeam(pt)
		if self.find_by(driver1_name: pt.primary_driver.name, driver2_name: pt.secondary_driver.name)
			return false
		end
		if self.find_by(engine_name: pt.engine.name, chassis_name: pt.chassis_manufacturer.name)
			return false
		end
		if self.find_by(driver1_name: pt.primary_driver.name, chassis_name: pt.chassis_manufacturer.name)
			return false
		end
		if self.find_by(driver1_name: pt.primary_driver.name, engine_name: pt.engine.name)
			return false
		end
		if self.find_by(driver2_name: pt.secondary_driver.name, chassis_name: pt.chassis_manufacturer.name)
			return false
		end
		if self.find_by(driver2_name: pt.secondary_driver.name, engine_name: pt.engine.name)
			return false
		end
		return true
	end
end
