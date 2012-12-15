class CreateTeacherships < ActiveRecord::Migration
  def self.up
    create_table :teacherships do |t|
      t.references :teacher
      t.references :school_class
    end
end
end
