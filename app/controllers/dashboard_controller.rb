class DashboardController < ApplicationController
  
  skip_before_filter :has_info
  
  def home
    @user = current_user
  end

end
