class CreateDriverMarkets < ActiveRecord::Migration
  def change
    create_table :driver_markets do |t|
      t.integer :driver_id
      t.integer :round
      t.integer :value
      t.integer :score

      t.timestamps
    end
  end
end
