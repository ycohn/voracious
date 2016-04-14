class WelcomeController < ApplicationController
  skip_before_filter :login_required

  def index
    @user = User.new
  end
  
end
