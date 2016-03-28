class Book < ActiveRecord::Base
  has_many :readers
  has_many :users, through: :readers
  has_many :comments, as: :commentable
end