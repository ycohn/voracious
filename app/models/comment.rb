class Comment < ActiveRecord::Base
  attr_accessor :content
  belongs_to :commentable, polymorphic: true

  def commenter
    User.find(self.user_id).full_name
  end

end
