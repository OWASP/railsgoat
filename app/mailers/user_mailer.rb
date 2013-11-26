class UserMailer < ActionMailer::Base
  default from: "noreply@railsgoat.dev"

  def forgot_password(email, token)
    @token = token
    mail(to: "#{email}", subject: "Reset your RailsGoat password")
  end
end
