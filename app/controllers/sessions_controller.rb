class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have been logged in!"
    else
      @user = User.new
      flash.now[:error] = "Bad Username or Password"
      render :new
    end
  end
  
end
