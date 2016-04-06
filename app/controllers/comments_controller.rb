class CommentsController < ApplicationController
  before_action :load_commentable, except: :destroy
  def index
    # @commentable = 
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
     respond_to do |format|
      format.js { }
      format.html { redirect_to "/#{@commentable.class.to_s.pluralize.downcase}" }
     end 
    else
      respond_to do |format|
       format.js {render 'comments/create.js.erb' }
       format.html { redirect_to "/#{@commentable.class.to_s.pluralize.downcase}" }
      end 
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment_id = @comment.id
    @commentable = @comment.commentable_type
    @comment.destroy
      respond_to do |format|
        format.js { }
        format.html { redirect_to "/#{@commentable.to_s.pluralize.downcase}" }
      end
  end

private

  def load_commentable
    klass = params[:commentable_type]
    @commentable = klass.classify.constantize.find(params[:commentable_id])
  end

  def comment_params
    params.permit(:words, :user_id, :commentable_type, :commentable_id, :created_at, :updated_at, :book_id)
  end
end
