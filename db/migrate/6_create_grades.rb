class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.references :student
      t.references :subject
      t.integer :value
      # 1 is regular ,2 is final exam  
      t.integer :grade_type
    end
    add_index :grades, :subject_id
    add_index :grades, :student_id
  end
end
