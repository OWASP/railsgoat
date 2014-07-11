class SessionsController < ApplicationController
  skip_before_filter :has_info
  skip_before_filter :authenticated, :only => [:new, :create]

  def new
    @url = params[:url]
    redirect_to home_dashboard_index_path if current_user
  end

  def create
    path = params[:url].present? ? params[:url] : home_dashboard_index_path
    begin
      # Normalize the email address, why not
      user = User.authenticate(params[:email].to_s.downcase, params[:password])
      # @url = params[:url]
      rescue Exception => e
    end

    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token if User.where(:user_id => user.user_id).exists?
      else
        session[:user_id] = user.user_id if User.where(:user_id => user.user_id).exists?
      end
      redirect_to path
    else
      # Removed this code, just doesn't seem specific enough!
      #  flash[:error] = "Either your username and password is incorrect"
      flash[:error] = e.message
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    reset_session
    redirect_to root_path
  end
end
