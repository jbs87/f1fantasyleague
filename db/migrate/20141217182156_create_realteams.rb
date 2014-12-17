class CreateRealteams < ActiveRecord::Migration
  def change
    create_table :realteams do |t|
      t.integer :driver1_id
      t.integer :driver2_id
      t.integer :engine_id
      t.integer :chassis_manufacturer_id

      t.timestamps
    end
  end
end
