class CreateMessages < ActiveRecord::Migration
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
