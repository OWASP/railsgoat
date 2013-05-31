class WorkInfo < ActiveRecord::Base
  attr_accessible :DoB, :SSN, :bonuses, :income, :years_worked
  belongs_to :user
  
  # We should probably use this
  def last_four
    "***-**-" << self.SSN[-4,4]
  end
  
end
