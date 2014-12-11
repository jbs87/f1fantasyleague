class AddConstructorIdToEngine < ActiveRecord::Migration
  def change
  	add_column :engines, :constructorId, :string
  	add_column :chassis_manufacturers, :constructorId, :string
  end
end
