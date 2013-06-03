class BenefitFormsController < ApplicationController
  
  def index
  end
  
  def download
   begin  
     file = Rails.root.join('public', 'docs', params[:name])
     send_file file, :disposition => 'attachment'
   rescue
     redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
   end
  end
  
=begin
    # More secure version
    def download
     file_assoc = {"1" => "Health_n_Stuff.pdf", "2" => "Dental_n_Stuff.pdf"}
     begin  
       if file_assoc.has_key?(params[:name].to_s)
          file = Rails.root.join('public', 'docs', file_assoc[params[:name].to_s])
          send_file file, :disposition => 'attachment'
       else 
         file =  Rails.root.join('public', 'docs', "Dental_n_Stuff.pdf")
       end
     rescue
       redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
     end
    end
=end  
  
end
