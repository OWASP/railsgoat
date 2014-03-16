class PayController < ApplicationController
  
  def index
  end
  
  def update_dd_info
    msg = false
    pay = Pay.new(
    :bank_account_num => params[:bank_account_num], 
    :bank_routing_num => params[:bank_routing_num], 
    :percent_of_deposit => params[:dd_percent]
    )
    pay.user_id = current_user.user_id
    msg = true if pay.save! 
    respond_to do |format|
      format.json {render :json => {:msg => :world} }
    end
  end
  
  def show
   respond_to do |format|
     format.json { render :json => {:user => current_user.pay.as_json} }
   end
  end
  
end
