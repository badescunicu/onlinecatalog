require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

enable :sessions

configure do
  options = { :adapter  => "sqlite3", :database => "dev.db" }
  ActiveRecord::Base.establish_connection(options)
  ActiveRecord::Base.logger = Logger.new(STDERR)
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
end

before do
  session[:first_time_visitor] ||= true
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
    puts "ramura1"
  elsif session[:first_time_visitor]
      @display_login_form = true
      puts "ramura2"
    else
      @display_login_failed_message = true
      puts "ramura3"
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
      puts "success"
    else
      @@combination_of_login_and_password_is_correct = false
    end
  else 
    @@combination_of_login_and_password_is_correct = false
  end 
  redirect "/" 
end

post "/logout" do
  session[:first_time_visitor] = true
  session[:signed_in_user_id] = 0
  @@combination_of_login_and_password_is_correct = false

  redirect "/"
end
