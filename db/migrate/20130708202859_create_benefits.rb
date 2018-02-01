# frozen_string_literal: true
class CreateBenefits < ActiveRecord::Migration[4.2]
  def change
    create_table :benefits do |t|

      t.timestamps
    end
  end
end
