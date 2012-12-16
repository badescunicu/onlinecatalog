require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

enable :sessions

configure do
  options = { :adapter  => "sqlite3", :database => "dev.db" }
  ActiveRecord::Base.establish_connection(options)
  ActiveRecord::Base.logger = Logger.new(STDERR)
  @@grade_type_descriptions = {1 => "R", 2 => "FE"}
end

class User < ActiveRecord::Base
end

class Student < ActiveRecord::Base
  belongs_to :school_class
  belongs_to :user
end

class Teacher < ActiveRecord::Base
  belongs_to :user
end

class Subject < ActiveRecord::Base
end

class SchoolClass < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
end

class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject
end

class Teachership < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :school_class
  belongs_to :subject
end

class AugmentedGrade < ActiveRecord::Base
end

class AugmentedTeachership < ActiveRecord::Base
end 

before do
  session[:first_time_visitor] ||= true
  @user_is_signed_in = session[:signed_in_user_id] != 0
  session[:signed_in_user_id] ||= 0
  if session[:signed_in_user_id] != 0 
    user_record = User.find_by_id(session[:signed_in_user_id])
    @signed_in_fullname = user_record.fullname 
    @signed_in_user_type = user_record.user_type  
   end
  if session[:first_time_visitor]
    session[:signed_in_user_id] ||= 0
    @@combination_of_login_and_password_is_correct ||= false 
  end
end

get "/" do 
  @display_welcome_message = false
  @display_login_form = false
  @display_login_failed_message = false

  if @@combination_of_login_and_password_is_correct 
    @display_welcome_message = true
  elsif session[:first_time_visitor] 
      @display_login_form = true
    else
      @display_login_failed_message = true
  end
  
  if session[:signed_in_user_id] != 0
    if @signed_in_user_type == 'S'
      redirect '/s'
    end
    if @signed_in_user_type == 'T'
      redirect '/t'
    end
  end
  erb :index
end

post "/login" do
  login=params[:login].to_s
  password=params[:password].to_s   
  user_record = User.find_by_login(login)
  session[:first_time_visitor] = false
  @@combination_of_login_and_password_is_correct = true 
  if user_record
    user_password = BCrypt::Password.new(user_record.passwordhash)
    if user_password == password
      session[:signed_in_user_id] = user_record.id        
    else
      @@combination_of_login_and_password_is_correct = false
    end
  else 
    @@combination_of_login_and_password_is_correct = false
  end 
  redirect "/" 
end

get "/t" do
  teacher = Teacher.find_by_user_id(session[:signed_in_user_id])  
  @teacherships = AugmentedTeachership.find_all_by_teacher_id(teacher.id)
  erb :t
end

get "/s" do
  student = Student.find_by_user_id(session[:signed_in_user_id])  
  @grades = AugmentedGrade.find_all_by_student_id(student.id)
  erb :s
end

get "/school_class/:sc_id/subject/:subj_id" do
  sc_id = params[:sc_id].to_i
  subj_id = params[:subj_id].to_i
  @subj_name = Subject.find_by_id(subj_id).subject_name
  school_class = SchoolClass.find_by_id(sc_id)
  students = school_class.students
  @stud_grades = []
  students.each do |st|
    stud_record = {}
    stud_record[:fullname] = st.user.fullname
    stud_grades = []
    all_grades = Grade.where({:student_id => st.id, :subject_id => subj_id})
    all_grades.each do |g|
      stud_grades << g.value.to_s + "(" + @@grade_type_descriptions[g.grade_type] + ")"
    end
    stud_record[:string_representation_of_grades] = stud_grades.join(", ")
    @stud_grades << stud_record
  end

  erb :view_grades
end

get "/logout" do
  session[:first_time_visitor] = true
  session[:signed_in_user_id] = 0
  @@combination_of_login_and_password_is_correct = false
  redirect "/"
end
