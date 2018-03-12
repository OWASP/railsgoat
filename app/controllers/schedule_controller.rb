# frozen_string_literal: true
class ScheduleController < ApplicationController

  def create
    message = false

      if params[:schedule][:event_type] == "pto"
        sched = Schedule.new(schedule_params)
        sched.date_begin, sched.date_end = format_schedule_date(params[:date_range1])
        sched.user_id = current_user.id
        a = sched.date_end
        if sched.save
          message = true
        end
      end

    respond_to do |format|
      format.json { render json: {msg: message ? "success" : "failure" } }
    end
  end

  def get_pto_schedule
    begin
       schedules = current_user.paid_time_off.schedule
       jfs = []
       schedules.each do |s|
          hash = Hash.new
          hash[:id] = s[:id]
          hash[:title] = s[:event_name]
          hash[:start] = s[:date_begin]
          hash[:end] = s[:date_end]
          jfs << hash
       end
    rescue
    end
    respond_to do |format|
       format.json { render json: jfs.to_json }
    end
  end

  private

  # Returns a two part array consisting of dates
  # First value is the begin date and the second is the end date
  def format_schedule_date(date_array)
   begin
     vals = []
     return vals if date_array.empty?
     date_array.split("-").each do |s|
       date = Date.strptime(s.strip, "%m/%d/%Y")
       vals <<(date)
     end
   rescue ArgumentError
     return []
   end
     return vals
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date_begin, :date_end, :event_desc, :event_name, :event_type)
  end
end
