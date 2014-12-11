class RenameNicknameToDriverid < ActiveRecord::Migration
  def change
    rename_column :drivers, 'nickname', 'driverId'
  end
end
