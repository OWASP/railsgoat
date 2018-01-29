# frozen_string_literal: true
class CreatePaidTimeOffs < ActiveRecord::Migration[4.2]
  def change
    create_table :paid_time_offs do |t|
      t.integer :user_id
      t.integer :sick_days_taken
      t.integer :sick_days_earned
      t.integer :pto_taken
      t.integer :pto_earned

      t.timestamps
    end
  end
end
