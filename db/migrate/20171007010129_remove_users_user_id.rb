class RemoveUsersUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :user_id, :integer
  end
end
