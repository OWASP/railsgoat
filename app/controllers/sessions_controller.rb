class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    redirect_to home_dashboard_index_path if current_user
  end
  

  def create
     
      begin
        user = User.authenticate(params[:email], params[:password])
      rescue Exception => e
      end
      
      if user
        session[:id] = user.id if User.where(:id => user.id).exists?
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
