class ApplicationController < ActionController::Base

  before_filter :authenticated
  helper_method :current_user, :is_admin?
  
  # Our security guy keep talking about sea-surfing, cool story bro.
  # protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find_by_user_id(session[:user_id].to_s)
  end
  
  def authenticated
     redirect_to root_url and reset_session if not current_user
  end

  def is_admin?
    admin = current_user.admin if current_user 
  end

  def administrative
    if not is_admin?
     reset_session
     redirect_to login_path 
   end
  end
  
end
