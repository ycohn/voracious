class RegistrationsController < ApplicationController
  skip_before_filter :login_required

  def new
    @user = User.new
     # respond_to do |format|
     #  format.js { }
     #  format.html { redirect_to new_registration_path }
     # end 
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      @user.send_activation_email
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :username, :last_name, :email, :password, :password_confirmation, :teacher, :activation_digest)
  end

end
