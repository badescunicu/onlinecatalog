class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.references :student
      t.references :subject
      t.integer :value
      t.integer :type
    end
  end
end
