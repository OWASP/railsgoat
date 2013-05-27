class PaidTimeOff < ActiveRecord::Base
  attr_accessible :pto_earned, :pto_taken, :sick_days_earned, :sick_days_taken, :user_id
  belongs_to :user
  has_one :schedule, :foreign_key => :user_id, :primary_key => :user_id

  # Refactor this duplication when it's not 3am
  def sick_days_remaining(val="")
      self.sick_days_earned - self.sick_days_taken
  end
  
 
  def pto_days_remaining(val="")
      self.pto_earned - self.pto_taken
  end
  
  def pto_percentages
  end

  
end
