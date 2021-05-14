# frozen_string_literal: true
class CreatePays < ActiveRecord::Migration[4.2]
  def change
    create_table :pays do |t|
      t.integer :user_id
      t.string :bank_account_num
      t.string :bank_routing_num
      t.integer :percent_of_deposit

      t.timestamps
    end
  end
end
