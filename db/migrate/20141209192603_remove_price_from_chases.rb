class RemovePriceFromChases < ActiveRecord::Migration
  def change
  	remove_column :chases, :score, :int
  	remove_column :drivers, :score, :int
  	remove_column :engines, :score, :int
  end
end
