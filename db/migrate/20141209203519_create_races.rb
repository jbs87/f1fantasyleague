class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.datetime :date
      t.integer :track_id
      t.string :name
      t.integer :round

      t.timestamps
    end
  end
end
