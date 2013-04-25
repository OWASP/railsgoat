class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    redirect_to dashboard_home_path(:dashboard_id => current_user.id) if current_user && current_user.id
  end
  
  def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:id] = user.id if User.where(:id => user.id).exists?
        redirect_to dashboard_home_path(:dashboard_id => user.id)
      else
        render "new"
      end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end

end
