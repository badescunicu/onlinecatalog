class CreateTeacherships < ActiveRecord::Migration
  def self.up
    create_table :teacherships do |t|
      t.references :teacher
      t.references :school_class
      t.references :subject     
    end
    add_index :teacherships, :teacher_id
    add_index :teacherships, :school_class_id
    add_index :teacherships, :subject_id
    add_index :teacherships, [:teacher_id, :school_class_id, :subject_id], :unique => true, :name => 'teachership_unique'
  end
end
