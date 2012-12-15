class CreateAugmentedSchoolClasses < ActiveRecord::Migration
  def self.up
    stmt = "CREATE VIEW " +
             "augmented_school_classes " +
           "AS " +
           "SELECT " +
             "school_classes.id, " +
             "school_classes.name, " +
             "school_classes.teacher_id " +
           "FROM " +
             "school_classes, " +
             "teachers " +
           "WHERE " +
             "school_classes.teacher_id = teachers.id"
    ActiveRecord::Base.connection.execute(stmt)
  end
end
