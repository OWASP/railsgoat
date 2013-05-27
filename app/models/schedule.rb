class Schedule < ActiveRecord::Base
  attr_accessible :date_begin, :date_end, :event_desc, :event_name, :event_type, :user_id
  belongs_to :paid_time_off
end
