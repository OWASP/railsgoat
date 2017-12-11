# frozen_string_literal: true
class UserMailer < ActionMailer::Base
  default from: "noreply@railsgoat.dev"

  def forgot_password(email, token)
    @token = token
    @url = url_for(controller: "password_resets", action: "reset_password", only_path: false) + "?token=#{token}"

    mail(to: "#{email}", subject: "Reset your MetaCorp password")
  end
end
