class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.references :class
      t.references :user
      t.string :fullname

    end
  end
end
