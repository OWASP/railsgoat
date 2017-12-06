# frozen_string_literal: true
class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|

      t.timestamps
    end
  end
end
