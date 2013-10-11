class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :creator_id, :message, :read, :receiver_id
  
end