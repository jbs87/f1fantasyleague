class SorceryCore < ActiveRecord::Migration
  def change
    change_table :users do |t|
      #  users table already existed but the sorcery initializer
      #  wanted to create a new one.
      
      # t.string :email,            :null => false
      t.string :crypted_password #, :null => false
      t.string :salt #,             :null => false

      #t.timestamps
    end

    add_index :users, :email, unique: true
  end
end