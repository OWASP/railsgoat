# frozen_string_literal: true
class PaidTimeOffController < ApplicationController

  def index
    @pto = current_user.paid_time_off
    @schedule = Schedule.new
  end
end
