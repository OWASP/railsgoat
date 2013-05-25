class PaidTimeOff < ActiveRecord::Base
  attr_accessible :pto_earned, :pto_taken, :sick_days_earned, :sick_days_taken, :user_id
  belongs_to :user
  
end
