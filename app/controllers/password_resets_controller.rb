class PasswordResetsController < ApplicationController
  skip_before_filter :authenticated, :only => [:reset_password]

  def reset_password
    token = params[:token] unless params[:token].nil?

    if token && is_valid?(token)
      flash[:success] = "Password reset token confirmed! Please create a new password."
      #redirect_to :reset_password
    else
      flash[:error] = "Invalid password reset token. Please try again."
      redirect_to :login
    end
  end

  private

  def is_valid?(token)
    if token =~ /(?<user_id>\d+)-(?<email_hash>[A-Z0-9]{32})/i

      # Fetch the user by their id, and hash their email address
      user = User.find_by_id($~[:user_id])
      email = Digest::MD5.hexdigest(user.email)

      # Compare and validate our hashes
      return true if email == $~[:email_hash]
    end
  end
end
