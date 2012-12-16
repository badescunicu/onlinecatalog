class CreateAugmentedTeacherships < ActiveRecord::Migration
  def self.up
    stmt = "CREATE VIEW " +
             "augmented_teacherships " +
           "AS " +
           "SELECT " +
             "teacherships.id, " +
             "teacherships.teacher_id, " +
             "teacherships.school_class_id, " +
             "school_classes.name, " +
             "teacherships.subject_id, " +
             "subjects.subject_name " +
           "FROM " +
             "teacherships, " +
             "school_classes, " +
             "subjects " +
           "WHERE " +
             "teacherships.school_class_id = school_classes.id " +
             "AND " + 
             "teacherships.subject_id = subjects.id"
    ActiveRecord::Base.connection.execute(stmt)
  end
end
