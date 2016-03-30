class CommentsController < ApplicationController
  before_action :load_commentable
  def index
    # @commentable = 
    @comments = @commentable.comments
  end

  def new
    @comment = Comment.new
  end

private

  def load_commentable
    klass = [Log, Book].detect {|c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
