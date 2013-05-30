class Retirement < ActiveRecord::Base
  attr_accessible :employee_contrib, :employer_contrib, :total
  belongs_to :user
end
