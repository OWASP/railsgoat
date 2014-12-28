class KeyManagement < ActiveRecord::Base
  belongs_to :work_info
  belongs_to :user
end
