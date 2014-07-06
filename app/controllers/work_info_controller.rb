class WorkInfoController < ApplicationController
  def index
    @user = User.find_by_user_id(params[:user_id])
    if !(@user) || @user.admin
      flash[:error] = "Sorry, no user with that user id exists"
      redirect_to home_dashboard_index_path
    end
  end

=begin
  # More secure version
  def index
    @user = current_user
    if !(@user) || @user.admin
      flash[:error] = "Apologies, looks like something went wrong"
      redirect_to home_dashboard_index_path
    end
  end
=end
end
