class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :price
      t.integer :score

      t.timestamps
    end
  end
end
