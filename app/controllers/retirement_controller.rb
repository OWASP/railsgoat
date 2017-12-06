# frozen_string_literal: true
class RetirementController < ApplicationController

  def index
    @info = current_user.retirement
  end
end
