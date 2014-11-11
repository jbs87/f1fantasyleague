class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :name
      t.integer :price
      t.integer :score

      t.timestamps
    end
  end
end
