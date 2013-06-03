class BenefitFormsController < ApplicationController
  
  def index
  end
  
  def download
   begin  
     #file = params[:type].constantize.new(params[:name])
     file = Rails.root.join('public', 'docs', params[:name])
     #render :text => File.read(file) 
     send_file file, :disposition => 'attachment'
   rescue
     redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
   end
  end
  
end
