class Course < ActiveRecord::Base
  belongs_to :teacher, :class_name => "User"
  has_many :students, through: :students_courses
  has_many :students_courses
  has_many :comments, as: :commentable
end