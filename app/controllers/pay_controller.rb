class PayController < ApplicationController
  
  def index
  end
  
  def update_dd_info
    respond_to do |format|
      format.json {render :json => {:hello => :world} }
    end
  end
  
end
