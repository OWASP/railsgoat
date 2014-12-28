class Schedule < ActiveRecord::Base
  belongs_to :paid_time_off

  validates_presence_of :date_begin, :date_end, :event_desc, :event_name, :event_type
end
