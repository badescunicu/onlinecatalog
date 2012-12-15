users = [
  {:login => 'vlad', :passwordhash => '$2a$10$DWYf58.5XjvFumPvDtK/g.rRkGiBPLrFgbLdmvMwoV3OUY.7Bsbpu'},
  {:login => 'nicu', :passwordhash => '$2a$10$mz.pdMIEayg4FgY/Z.eHBOu5lT4rCqVr8f3WQXxFqE6kX.m5iTq0K'},
  {:login => 'admin', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS'},
  {:login => 'teacher', :passwordhash => '$2a$10$OMeMPH4QtFiEj1V5lsdRM.cx.D4IJ.fR3Eu21NgzrWaConyIX6itS'}
]

users.each do |u|
  User.create(u)
end

subjects = [
  {:subject_name => "English"},
  {:subject_name => "Math"},
  {:subject_name => "Geography"},
  {:subject_name => "History"}
]

subjects.each do |s|
  Subject.create(s)
end

u = User.find_by_login('teacher')
t = Teacher.new
t.user = u
t.save

SchoolClass.create({:teacher => t, :name => '10B'})
 
Student.create({:school_class => SchoolClass.find_by_name('10B'), :user => User.find_by_login('vlad'), :fullname => "Barbu Vlad"})

Grade.create({:student => Student.find_by_fullname("vlad"), :subject => Subject.find_by_subject_name("English"), :value => 10, :type => 1})
Grade.create({:student => Student.find_by_fullname("vlad"), :subject => Subject.find_by_subject_name("Math"), :value => 10, :type => 1})
Grade.create({:student => Student.find_by_fullname("vlad"), :subject => Subject.find_by_subject_name("History"), :value => 10, :type => 2})




