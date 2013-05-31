class WorkInfo < ActiveRecord::Base
  attr_accessible :DoB, :SSN, :bonuses, :income, :user_id, :years_worked
  belongs_to :user
end
