class CreateTeacherships < ActiveRecord::Migration
  def self.up
    create_table :teacherships do |t|
      t.references :teacher
      t.references :class
    end
end
end
