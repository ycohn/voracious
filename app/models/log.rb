class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments, as: :commentable
  validates :book_id, presence: true
  validates :content, presence: true
  validates :pages, presence: true
  validates :minutes, presence: true
end