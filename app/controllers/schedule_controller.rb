class ScheduleController < ApplicationController
  def create
    respond_to do |format|
      format.json {render :json => {:msg => "success"}}
    end
  end
end
