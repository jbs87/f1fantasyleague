class CreateValueOverviews < ActiveRecord::Migration
  def change
    create_table :value_overviews do |t|
      t.integer :position
      t.integer :driver_race
      t.integer :chassis_race

      t.timestamps
    end
  end
end
