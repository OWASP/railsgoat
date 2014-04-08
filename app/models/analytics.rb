class Analytics < ActiveRecord::Base
  attr_accessible :ip_address, :referrer, :user_agent

  scope :hits_by_ip, ->(ip,col="*") { select("#{col}").where("ip_address = '#{ip}'")}

  def self.count_by_col(col)
  	calculate(:count, col)
  end
end
