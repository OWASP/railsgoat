class UsersController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to dashboard_home_path(:dashboard_id => user.id)
    else
      @user = User.new
      render :new
    end
  end
  
end
