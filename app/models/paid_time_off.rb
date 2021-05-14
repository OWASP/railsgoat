# frozen_string_literal: true
class PaidTimeOff < ApplicationRecord
  belongs_to :user
  has_many :schedule, foreign_key: :user_id, primary_key: :user_id, dependent: :destroy

  def sick_days_remaining
    self.sick_days_earned - self.sick_days_taken
  end

  def pto_days_remaining
    self.pto_earned - self.pto_taken
  end

  def sick_days_taken_percentage
    result = self.sick_days_taken.to_f /  self.sick_days_earned.to_f * 100.0
  end
end
