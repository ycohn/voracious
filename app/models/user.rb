class User < ActiveRecord::Base
  has_many :courses, through: :students_courses
  has_many :courses, :foreign_key => 'teacher_id'
  has_many :logs
  has_many :books, through: :readers
  has_many :students_courses, :foreign_key => 'student_id'
  has_secure_password

def full_name
  @full_name = "#{self.first_name} #{self.last_name}"
end


end

