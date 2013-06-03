class WorkInfoController < ApplicationController
  
  def index
    @user = User.find_by_user_id(params[:user_id])
    if !(@user)
      flash[:error] = "Sorry, no user with that user id exists"
      redirect_to home_dashboard_index_path
    end
  end
  
end
