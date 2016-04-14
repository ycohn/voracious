class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # session[:user_id] = @user.id
    else
    end
  end

  def destroy
    
  end

  def show
    @user = current_user
    @log = Log.new
    @book = Book.new
  end

  private

  def user_params
    params.permit(:first_name, :username, :last_name, :email, :password, :password_confirmation, :teacher)
  end
end
