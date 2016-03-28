class User < ActiveRecord::Base
  has_many :courses, :foreign_key => 'teacher_id'
  has_many :courses, through: :students_courses, :foreign_key => 'student_id'
  has_many :logs
  has_many :books, through: :readers
  has_secure_password
end
