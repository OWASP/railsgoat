# frozen_string_literal: true
class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :creator_id, :receiver_id, :message

  def creator_name
    if creator = User.where(id: self.creator_id).first
      creator.full_name
    else
      "Name unavailable"
    end
  end
end
