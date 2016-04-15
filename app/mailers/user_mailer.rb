class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Voracious Account Activation"
  end

  def password_reset
    @greeting = "Hi"

    mail to: user.email, subject: "Voracious-Password Reset"
  end
end
