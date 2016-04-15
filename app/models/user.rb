class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  has_many :courses, through: :students_courses
  has_many :courses, :foreign_key => 'teacher_id'
  has_many :logs
  has_many :books, through: :readers
  has_many :readers
  has_many :students_courses, :foreign_key => 'student_id'
  has_secure_password

  before_save   :downcase_email
  before_create :create_activation_digest

 def downcase_email
  self.email = email.downcase
 end

def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

 def User.new_token
  SecureRandom.urlsafe_base64
 end

def activate
  update_attribute(:activated, true)
  update_attribute(:activated_at, Time.zone.now)
end

def send_activation_email
  UserMailer.account_activation(self).deliver_now
end

 def full_name
  @full_name = "#{self.first_name} #{self.last_name}"
 end

 def all_students
  my_students = []
  self.courses.each do |course|
    course.students.each do |student|
      my_students << student
    end
  end
  my_students
 end

def authenticated?(attribute, token)
 digest = send("#{attribute}_digest")
 return false if digest.nil?
 BCrypt::Password.new(digest).is_password?(token)
end

  private

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end

