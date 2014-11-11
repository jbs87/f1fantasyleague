class CreateChases < ActiveRecord::Migration
  def change
    create_table :chases do |t|
      t.string :name
      t.integer :price
      t.integer :score

      t.timestamps
    end
  end
end
