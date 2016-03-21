class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
    end
  end

  def destroy

  end

  private

  def user_params
    params.permit(:first_name, :username, :last_name, :email, :password, :password_confirmation, :teacher)
  end
end
