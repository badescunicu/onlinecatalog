require 'sinatra'
require 'sinatra/activerecord'

configure do
  options = { :adapter  => "sqlite3", :database => "dev.db" }
  ActiveRecord::Base.establish_connection(options)
  ActiveRecord::Base.logger = Logger.new(STDERR)
end

class User < ActiveRecord::Base
end

class Student < ActiveRecord::Base
  belongs_to :class
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
