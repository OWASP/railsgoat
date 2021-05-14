# frozen_string_literal: true
class CreateWorkInfos < ActiveRecord::Migration[4.2]
  def change
    create_table :work_infos do |t|
      t.integer :user_id
      t.string :income
      t.string :bonuses
      t.integer :years_worked
      t.string :SSN
      t.date :DoB

      t.timestamps
    end
  end
end
