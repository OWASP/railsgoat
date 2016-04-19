class UsersController < ApplicationController
  skip_before_filter :has_info
  skip_before_filter :authenticated, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.build_benefits_data
    if user.save
      session[:user_id] = user.user_id
      redirect_to home_dashboard_index_path
    else
      @user = user
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to :signup
    end
  end

  def account_settings
    @user = current_user
  end

  def update
    message = false
  
    user = User.where("user_id = '#{params[:user][:user_id]}'").first
    if user
      user.skip_user_id_assign = true
      user.skip_hash_password = true
      user.update_attributes(user_params_without_password)
      if !(params[:user][:password].empty?) && (params[:user][:password] == params[:user][:password_confirmation])
        user.skip_hash_password = false
        user.password = params[:user][:password]
      end
      message = true if user.save!
      respond_to do |format|
        format.html { redirect_to user_account_settings_path(:user_id => current_user.user_id) }
        format.json { render :json => {:msg => message ? "success" : "false "} }
      end
    else
      flash[:error] = "Could not update user!"
      redirect_to user_account_settings_path(:user_id => current_user.user_id)
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

  # unpermitted attributes are ignored in production
  def user_params_without_password
    params.require(:user).permit(:email, :admin, :first_name, :last_name)
  end
end
