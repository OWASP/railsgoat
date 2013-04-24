class SessionsController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new]
  
  def new
  end

end
