class TutorialsController < ApplicationController
  skip_before_filter :has_info
  skip_before_filter :authenticated

  def credentials
    render :partial => "layouts/tutorial/credentials/creds"
  end

end
