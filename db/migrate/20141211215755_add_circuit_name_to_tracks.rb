class AddCircuitNameToTracks < ActiveRecord::Migration
  def change
  	 add_column :tracks, :circuitName, :string
  end
end
