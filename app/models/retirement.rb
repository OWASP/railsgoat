class Retirement < ActiveRecord::Base
  attr_accessible :employee_contrib, :employer_contrib, :total, :user_id
  belongs_to :user
end
