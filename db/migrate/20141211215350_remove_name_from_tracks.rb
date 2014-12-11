class RemoveNameFromTracks < ActiveRecord::Migration
  def up
  	remove_column :tracks, :name
  end

  def down
  	add_column :tracks, :name, :string
  end
end
