class AddNicknameToDrivers < ActiveRecord::Migration
  def change
  	add_column :drivers, :nickname, :string
  end
end
