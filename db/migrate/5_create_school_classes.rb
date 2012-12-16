class CreateSchoolClasses < ActiveRecord::Migration
  def self.up
    create_table :school_classes do |t|
      t.references :teacher
      t.string :name
    end
    add_index :school_classes, :teacher_id
    add_index :school_classes, :name
  end
end
