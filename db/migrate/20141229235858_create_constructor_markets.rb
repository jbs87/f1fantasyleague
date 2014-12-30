class CreateConstructorMarkets < ActiveRecord::Migration
  def change
    create_table :constructor_markets do |t|
      t.integer :chassis_manufacturers_id
      t.integer :round
      t.integer :value
      t.integer :score

      t.timestamps
    end
  end
end
