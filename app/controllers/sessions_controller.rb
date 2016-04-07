class SessionsController < ApplicationController
  skip_before_filter :login_required
  
  def new
    # binding.pry
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # binding.pry
      redirect_to root_path, notice: "You have been logged in!"
    else
      @user = User.new
      flash.now[:error] = "Bad Username or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    # binding.pry
    redirect_to root_path, notice: "You have been logged out!"
  end

  
end
