# frozen_string_literal: true
class TutorialsController < ApplicationController
  skip_before_action :has_info
  skip_before_action :authenticated

  def credentials
    render layout: false
  end

end
