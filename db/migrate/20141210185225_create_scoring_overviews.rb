class CreateScoringOverviews < ActiveRecord::Migration
  def change
    create_table :scoring_overviews do |t|
      t.integer :driver_qual
      t.integer :driver_race
      t.integer :chassis_qual
      t.integer :chassis_race

      t.timestamps
    end
  end
end
