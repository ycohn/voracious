class AccountActivationsController < ApplicationController
  skip_before_filter :login_required

   def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      session[:user_id] = user.id
      flash[:success] = "Account activated!"
      redirect_to user_path(user)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
