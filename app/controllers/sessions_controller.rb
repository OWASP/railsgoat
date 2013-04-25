class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
  end
  
  def create
  end

end
