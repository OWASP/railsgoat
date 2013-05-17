class AdminController < ApplicationController
  
  def dashboard
    @users = User.all
  end
  
end
