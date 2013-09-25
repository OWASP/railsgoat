class UsersController < ApplicationController
  
  skip_before_filter :has_info
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    user.build_retirement(POPULATE_RETIREMENTS.shuffle.first)
    user.build_paid_time_off(POPULATE_PAID_TIME_OFF.shuffle.first).schedule.build(POPULATE_SCHEDULE.shuffle.first)
    user.build_work_info(POPULATE_WORK_INFO.shuffle.first)
    user.performance.build(POPULATE_PERFORMANCE.shuffle.first)
    if user.save
      session[:user_id] = user.user_id
      redirect_to home_dashboard_index_path
    else
      @user = user
      render :new
    end
  end
  
  def account_settings
    @user = current_user
  end
  
  def update
    message = false
    #Safest
    # user = current_user
    
    # Still an Insecure DoR vulnerability
    #user = User.find(:first, :conditions => ["user_id = ?", "#{params[:user][:user_id]}"])
    
    user = User.find(:first, :conditions => "user_id = '#{params[:user][:user_id]}'")
    user.skip_user_id_assign = true
    user.update_attributes(params[:user].reject { |k| %w(password password_confirmation user_id).include? k })
    pass = params[:user][:password]
    user.password = pass if !(pass.blank?)
    message = true if user.save!
    respond_to do |format|
      format.html { redirect_to user_account_settings_path(:user_id => current_user.user_id) }
      format.json { render :json => {:msg => message ? "success" : "false "} }
    end
  end
  
end
