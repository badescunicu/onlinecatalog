  vlad = User.create({:login => 'vlad', :passwordhash => '$2a$10$DWYf58.5XjvFumPvDtK/g.rRkGiBPLrFgbLdmvMwoV3OUY.7Bsbpu', :fullname => 'Barbu Vlad', :user_type => 'S'})
  nicu = User.create({:login => 'nicu', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K', :fullname => 'Badescu Nicolae', :user_type => 'S'})
  admin = User.create({:login => 'admin', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS', :fullname => 'Admin', :user_type => 'A'})
  teacher = User.create({:login => 'teacher', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS', :fullname => 'Teacher', :user_type => 'T'})

subjects = [
  {:subject_name => "English"},
  {:subject_name => "Math"},
  {:subject_name => "Geography"},
  {:subject_name => "History"}
]

subjects.each do |s|
  Subject.create(s)
end

t = Teacher.create({:user => teacher})

SchoolClass.create({:teacher => t, :name => '10B'})
 
st_vlad = Student.create({:school_class => SchoolClass.find_by_name('10B'), :user => vlad})
st_nicu = Student.create({:school_class => SchoolClass.find_by_name('10B'), :user => nicu})

Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("English"), :value => 10, :grade_type => 1})
Grade.create({:student => st_vlad, :subject => Subject.find_by_subject_name("Math"), :value => 10, :grade_type => 1})
Grade.create({:student => st_nicu, :subject => Subject.find_by_subject_name("History"), :value => 10, :grade_type => 2})




