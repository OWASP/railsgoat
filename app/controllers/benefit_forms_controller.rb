class BenefitFormsController < ApplicationController
  
  def index
  end


  def download
   begin  
     path = Rails.root.join('public', 'docs', params[:name])
     file = params[:type].constantize.new(path)
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
          path = Rails.root.join('public', 'docs', file_assoc[params[:name].to_s])
          if params[:type] == "File"
            file = params[:type].constantize.new(path)  
            send_file file, :disposition => 'attachment'
          end 
       else 
         file =  Rails.root.join('public', 'docs', "Dental_n_Stuff.pdf")
         send_file file, :disposition => 'attachment'
       end
     rescue
       redirect_to user_benefit_forms_path(:user_id => current_user.user_id)
     end
    end
=end      

  
end
