class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.datetime :racedate

      t.timestamps
    end
  end
end
