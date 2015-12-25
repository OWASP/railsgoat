class TutorialsController < ApplicationController
  skip_before_filter :has_info
  skip_before_filter :authenticate_user

  def credentials
    render :partial => "layouts/tutorial/credentials/creds"
  end

end
