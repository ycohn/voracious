class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :username, :last_name, :email, :password, :password_confirmation, :teacher)
  end

end
