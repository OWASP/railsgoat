class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    redirect_to home_dashboard_index_path if current_user
  end
  

  def create
     
      begin
        # Normalize the email address, why not
        user = User.authenticate(params[:email].to_s.downcase, params[:password])
      rescue Exception => e
      end
      
      if user
        session[:user_id] = user.user_id if User.where(:user_id => user.user_id).exists?
        redirect_to home_dashboard_index_path
      else
        # Removed this code, just doesn't seem specific enough!
        #  flash[:error] = "Either your username and password is incorrect" 
        flash[:error] = e.message
        render "new"
      end
      
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end

end
