class Api::V1::MobileController < ApplicationController

  skip_before_filter :authenticated
  before_filter :mobile_request?

  respond_to :json

  def show
    if params[:class]
      model = params[:class].classify.constantize
      respond_with model.find(params[:id]).to_json
    end
  end

  def index
    if params[:class]
      model = params[:class].classify.constantize
      respond_with model.all.to_json
    end
  end

  private

  def mobile_request?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /ios|android/i
    end
  end

end
