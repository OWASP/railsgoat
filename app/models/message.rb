class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :creator_id, :message, :read, :receiver_id
  validates_presence_of :creator_id, :receiver_id, :message

  def creator_name
    creator = User.where(:id => self.creator_id).first
    creator.full_name
  end
end