class PaidTimeOff < ActiveRecord::Base
  attr_accessible :pto_earned, :pto_taken, :sick_days_earned, :sick_days_taken, :user_id
  belongs_to :user
  has_one :schedule, :foreign_key => :user_id, :primary_key => :user_id

end
