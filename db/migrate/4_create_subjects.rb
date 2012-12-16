class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :subject_name
    end
    add_index :subjects, :subject_name 
  end
end
