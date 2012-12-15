class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.references :user

    end
  end
end
