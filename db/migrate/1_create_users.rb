class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :passwordhash
      t.string :fullname
      t.string :user_type
    end
    add_index :users, :login
  end
end
