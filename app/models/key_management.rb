class KeyManagement < ActiveRecord::Base
  attr_accessible :iv, :user_id
  belongs_to :work_info
  belongs_to :user
end
