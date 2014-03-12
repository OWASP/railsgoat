class Api::V1::UsersController < ApplicationController
  
   skip_before_filter :authenticated
   before_filter :valid_api_token
  
     respond_to :json
     
     def valid_api_token
       authenticate_or_request_with_http_token do |token, options|
        # TODO :add some functionality to check if the HTTP Header is valid
        return true
       end
     end
     
     def index
      respond_with User.all
     end
     
     
end
