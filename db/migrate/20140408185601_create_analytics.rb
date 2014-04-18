class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string		:ip_address
      t.string		:referrer
      t.string		:user_agent
      t.timestamps
    end
  end
end
