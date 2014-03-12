class Api::V1::UsersController < ApplicationController
  
   skip_before_filter :authenticated
     
     respond_to :json
     
     def index
       respond_with ({:hi => :world})
     end
  
end
