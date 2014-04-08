class ApplicationController < ActionController::Base

  before_filter :authenticated, :has_info
  helper_method :current_user, :is_admin?, :sanitize_font

  # Our security guy keep talking about sea-surfing, cool story bro.
  # protect_from_forgery

  private

  def current_user
    @current_user ||= (
      User.find_by_auth_token(cookies[:auth_token].to_s) || 
      User.find_by_user_id(session[:user_id].to_s)
    )
  end

  def authenticated
     path = request.fullpath.present? ? root_url(:url =>  request.fullpath) : root_url
     redirect_to path and reset_session if not current_user
  end

  def is_admin?
    current_user.admin if current_user
  end

  def administrative
    if not is_admin?
     #reset_session
     redirect_to root_url
   end
  end

  def has_info
    redirect = false
    if current_user
      begin
      if !(current_user.retirement || current_user.paid_time_off.schedule || current_user.paid_time_off || current_user.work_info || current_user.performance)
        redirect = true
      end
      rescue
         redirect = true
      end
    end
    redirect_to home_dashboard_index_path if redirect
  end

  def sanitize_font(css)
    css
    # css if css.match(/\A[0-9]+([\%]|pt)\z/)
  end

end
