class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.references :user

    end
    add_index :teachers, :user_id, :unique => true   
  end
end
