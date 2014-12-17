class AddImagePathToDriversEnginesAndManufacturer < ActiveRecord::Migration
  def change
    add_column :drivers, :image_url, :string
    add_column :engines, :image_url, :string
    add_column :chassis_manufacturers, :image_url, :string
  end
end
