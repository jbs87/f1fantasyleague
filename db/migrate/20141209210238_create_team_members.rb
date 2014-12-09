class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :driver_id
      t.integer :chassis_id
      t.integer :engine_id
      t.string :name
      t.integer :race_id

      t.timestamps
    end
  end
end
