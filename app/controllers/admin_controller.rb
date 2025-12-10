# frozen_string_literal: true
class AdminController < ApplicationController
  before_action :administrative, if: :admin_param, except: [:get_user]
  skip_before_action :has_info

  def dashboard
  end

  def analytics
    if params[:field].nil?
      fields = "*"
    else
      fields = custom_fields.join(",")
    end

    if params[:ip]
      @analytics = Analytics.hits_by_ip(params[:ip], fields)
    else
      @analytics = Analytics.all
    end
  end

  def get_all_users
    @users = User.all
  end

  def get_user
    @user = User.find_by_id(params[:admin_id].to_s)
    arr = ["true", "false"]
    @admin_select = @user.admin ? arr : arr.reverse
  end

  def update_user
    user = User.find_by_id(params[:admin_id])
    if user
      # VULNERABILITY: Using params[:user] directly without strong parameters
      # This allows mass assignment of any user attribute including 'admin'
      # See wiki: Extras:-Mass-Assignment-Admin-Role.md
      user_params = params[:user].to_unsafe_h if params[:user].respond_to?(:to_unsafe_h)
      user_params ||= params[:user]

      # Filter out password fields if blank to avoid validation errors
      filtered_params = user_params.reject { |k, v| (k == "password" || k == "password_confirmation") && v.blank? }

      user.update(filtered_params)
      user.save!
      flash[:success] = "User updated successfully"
      redirect_to admin_get_all_users_path(current_user.id)
    else
      flash[:error] = "User not found"
      redirect_to admin_get_all_users_path(current_user.id)
    end
  end

  def delete_user
    user = User.find_by(id: params[:admin_id])
    if user && !(current_user.id == user.id)
      # Call destroy here so that all association records w/ id are destroyed as well
      # Example user.retirement records would be destroyed
      user.destroy
      flash[:success] = "User deleted successfully"
    else
      flash[:error] = "Cannot delete this user"
    end
    redirect_to admin_get_all_users_path(current_user.id)
  end

  private

  def custom_fields
    params.require(:field).keys
  end
  helper_method :custom_fields

  def admin_param
    params[:admin_id] != "1"
  end
end
