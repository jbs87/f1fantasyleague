class CreateRealteams < ActiveRecord::Migration
  def change
    create_table :realteams do |t|
      t.string :driver1_name
      t.string :driver2_name
      t.string :engine_name
      t.string :chassis_name

      t.timestamps
    end
  end
end
