class AddPositionToScoreOverview < ActiveRecord::Migration
  def change
  	add_column :scoring_overviews, :position, :integer
  end
end
