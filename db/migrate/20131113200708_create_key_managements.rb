# frozen_string_literal: true
class CreateKeyManagements < ActiveRecord::Migration[4.2]
  def change
    create_table :key_managements do |t|
      t.string :iv
      t.integer :user_id

      t.timestamps
    end
  end
end
