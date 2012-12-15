class CreateSchoolClasses < ActiveRecord::Migration
  def self.up
    create_table :school_classes do |t|
      t.references :teacher
      t.string :name
    end
  end
end
