class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :event_type
      t.date :date_begin
      t.date :date_end
      t.string :event_name
      t.string :event_desc
      t.integer :user_id

      t.timestamps
    end
  end
end
