  vlad = User.create({:login => 'vlad', :passwordhash => '$2a$10$DWYf58.5XjvFumPvDtK/g.rRkGiBPLrFgbLdmvMwoV3OUY.7Bsbpu', :fullname => 'Barbu Vlad', :user_type => 'S'})
  nicu = User.create({:login => 'nicu', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K', :fullname => 'Badescu Nicolae', :user_type => 'S'})
  razvan = User.create({:login => 'razvan', :passwordhash => '$2a$10$DWYf58.5XjvFumPvDtK/g.rRkGiBPLrFgbLdmvMwoV3OUY.7Bsbpu', :fullname => 'Tache Razvan', :user_type => 'S'})
  admin = User.create({:login => 'admin', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS', :fullname => 'Admin', :user_type => 'A'})
  teacher_real = User.create({:login => 'teacher_real', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS', :fullname => 'Teacher Of Sciences', :user_type => 'T'})
  teacher_human = User.create({:login => 'teacher_human', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS', :fullname => 'Teacher Of Humanities', :user_type => 'T'})

  dan = User.create({:login => 'dan', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K', :fullname => 'Dan Serban', :user_type => 'S'})
  gabi = User.create({:login => 'gabi', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K', :fullname => 'Gabi Voicu', :user_type => 'S'})
  nichita = User.create({:login => 'nichita', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K', :fullname => 'Nichita Zloteanu', :user_type => 'S'})

subjects = [
  {:subject_name => "English"},
  {:subject_name => "Math"},
  {:subject_name => "Geography"},
  {:subject_name => "Physics"},
  {:subject_name => "Chemistry"},
  {:subject_name => "History"},
  {:subject_name => "Literature"}
]

subjects.each do |s|
  Subject.create(s)
end

t_real = Teacher.create({:user => teacher_real})
t_human = Teacher.create({:user => teacher_human})

cl_10b = SchoolClass.create({:teacher => t_real, :name => '10B'})
cl_11c = SchoolClass.create({:teacher => t_human, :name => '11C'})

st_vlad = Student.create({:school_class => cl_10b, :user => vlad})
st_nicu = Student.create({:school_class => cl_10b, :user => nicu})
st_razvan = Student.create({:school_class => cl_10b, :user => razvan})

st_dan = Student.create({:school_class => cl_11c, :user => dan})
st_gabi = Student.create({:school_class => cl_11c, :user => gabi})
st_nichita = Student.create({:school_class => cl_11c, :user => nichita})

Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("Physics"), :value => 10, :grade_type => 1})
Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("Physics"), :value => 10, :grade_type => 2})
Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("Chemistry"), :value => 9, :grade_type => 1})
Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("Chemistry"), :value => 7, :grade_type => 1})
Grade.create({:student => st_nicu, :subject => Subject.find_by_subject_name("History"), :value => 8, :grade_type => 2})
Grade.create({:student => st_dan, :subject => Subject.find_by_subject_name("History"), :value => 10, :grade_type => 1})
Grade.create({:student => st_gabi, :subject => Subject.find_by_subject_name("Literature"), :value => 2, :grade_type => 2})
Grade.create({:student => st_nichita, :subject => Subject.find_by_subject_name("Literature"), :value => 8, :grade_type => 1})
Grade.create({:student => st_nichita, :subject => Subject.find_by_subject_name("History"), :value => 9, :grade_type => 1})

Teachership.create(:teacher => t_real, :school_class => cl_10b, :subject => Subject.find_by_subject_name("Physics"))
Teachership.create(:teacher => t_real, :school_class => cl_10b, :subject => Subject.find_by_subject_name("Chemistry"))
Teachership.create(:teacher => t_human, :school_class => cl_11c, :subject => Subject.find_by_subject_name("History"))
Teachership.create(:teacher => t_human, :school_class => cl_11c, :subject => Subject.find_by_subject_name("Literature"))



