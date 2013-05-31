class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :user_id
      t.date :date_submitted
      t.integer :score
      t.string :comments
      t.integer :reviewer

      t.timestamps
    end
  end
end
