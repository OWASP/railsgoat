class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :creator_id, :message, :read, :receiver_id
  validates_presence_of :creator_id, :receiver_id, :message

  def creator_name
    if creator = User.where(:user_id => self.creator_id).first
      creator.full_name
    else
      "<b>Name unavailable</b>".html_safe
    end
  end
end
