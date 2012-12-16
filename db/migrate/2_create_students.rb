class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.references :school_class
      t.references :user
    end
    add_index :students, :school_class_id
    add_index :students, :user_id, :unique => true
  end
end
