class SessionsController < ApplicationController
  skip_before_filter :has_info

  def destroy
    cookies.delete(:auth_token)
    reset_session
    redirect_to root_path
  end
end
