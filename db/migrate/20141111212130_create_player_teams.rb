class CreatePlayerTeams < ActiveRecord::Migration
  def change
    create_table :player_teams do |t|
      t.integer :user_id
      t.integer :driver1_id
      t.integer :driver2_id
      t.integer :engine_id
      t.integer :chasis_id

      t.timestamps
    end
  end
end
