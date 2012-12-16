class CreateAugmentedGrades < ActiveRecord::Migration
  def self.up
    stmt = "CREATE VIEW " +
             "augmented_grades " +
           "AS " +
           "SELECT " +
             "grades.id, " +
             "grades.student_id, " +
             "grades.subject_id, " +
             "subjects.subject_name, " +
             "grades.value, " +
             "grades.grade_type " +
           "FROM " +
             "grades, " +
             "subjects " +
           "WHERE " +
             "grades.subject_id = subjects.id"
    ActiveRecord::Base.connection.execute(stmt)
  end
end
