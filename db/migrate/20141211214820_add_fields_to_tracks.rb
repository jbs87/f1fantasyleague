class AddFieldsToTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :circuitId, :string
  	add_column :tracks, :lat, :decimal, {:precision=>10, :scale=>6}
  	add_column :tracks, :long, :decimal, {:precision=>10, :scale=>6}
  	add_column :tracks, :country, :string
  	add_column :tracks, :locality, :string
  end
end
