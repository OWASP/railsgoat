# frozen_string_literal: true
class Analytics < ApplicationRecord
  scope :hits_by_ip, ->(ip, col = "*") { select("#{col}").where(ip_address: ip).order("id DESC") }

  def self.count_by_col(col)
    calculate(:count, col)
  end

  def self.parse_field(field)
    valid_fields = ["ip_address", "referrer", "user_agent"]

    if valid_fields.include?(field)
      field
    else
      "1"
    end
  end
end
