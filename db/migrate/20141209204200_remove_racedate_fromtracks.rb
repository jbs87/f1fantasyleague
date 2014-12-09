class RemoveRacedateFromtracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :racedate
  end
end
