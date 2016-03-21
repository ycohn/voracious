class User < ActiveRecord::Base
  has_many :classes
  has_secure_password
end
