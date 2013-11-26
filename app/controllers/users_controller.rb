class UsersController < ApplicationController

  skip_before_filter :has_info
  skip_before_filter :authenticated, :only => [:new, :create, :forgot_password]

  def forgot_password
    @user = User.find_by_email(params[:email]) unless params[:email].nil?

    if @user && password_reset_mailer_setup(@user)
      flash[:success] = "Password reset email sent to #{params[:email]}"
      redirect_to :login
    else
      flash[:error] = "There was an issue sending password reset email to #{params[:email]}".html_safe unless params[:email].nil?
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
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
    #Safest
    # user = current_user

    # Still an Insecure DoR vulnerability
    #user = User.find(:first, :conditions => ["user_id = ?", "#{params[:user][:user_id]}"])

    user = User.find(:first, :conditions => "user_id = '#{params[:user][:user_id]}'")
    if user
      user.skip_user_id_assign = true
      user.skip_hash_password = true
      user.update_attributes(params[:user].reject { |k| %w(password password_confirmation user_id).include? k })
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

  def password_reset_mailer_setup(user)
    token = generate_token(user.id, user.email)
    UserMailer.forgot_password(user.email, token).deliver
  end

  def generate_token(id, email)
    hash = Digest::MD5.hexdigest(email)
    "#{id}~#{hash}"
  end

end
