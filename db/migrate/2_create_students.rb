class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.references :school_class
      t.references :user
      t.string :fullname
    end
  end
end
