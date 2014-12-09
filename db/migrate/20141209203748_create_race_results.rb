class CreateRaceResults < ActiveRecord::Migration
  def change
    create_table :race_results do |t|
      t.integer :race_id
      t.integer :team_member_id
      t.integer :qualifying_pos
      t.integer :race_pos

      t.timestamps
    end
  end
end
