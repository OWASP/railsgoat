class Pay < ActiveRecord::Base
  attr_accessible :bank_account_num, :bank_routing_num, :percent_of_deposit
  belongs_to :user 
  
end
