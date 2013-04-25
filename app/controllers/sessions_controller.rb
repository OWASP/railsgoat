class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    redirect_to home_dashboard_index_path if current_user
  end
  
  def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:id] = user.id if User.where(:id => user.id).exists?
        redirect_to home_dashboard_index_path
      else
        render "new"
      end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end

end
