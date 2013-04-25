class UsersController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to home_dashboard_index_path
    else
      @user = User.new
      render :new
    end
  end
  
  def account_settings
  end
  
end
