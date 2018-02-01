# frozen_string_literal: true
class CreateMessages < ActiveRecord::Migration[4.2]
  def change
    create_table :messages do |t|
      t.integer :creator_id
      t.integer :receiver_id
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
