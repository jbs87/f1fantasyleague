class RenameChassis < ActiveRecord::Migration
  def change
    rename_table :chases, :chassis_manufacturers
  end
end
