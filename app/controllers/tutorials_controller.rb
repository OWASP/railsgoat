class TutorialsController < ApplicationController
  skip_before_action :has_info
  skip_before_action :authenticated

  def credentials
    render :partial => "layouts/tutorial/credentials/creds"
  end

end
