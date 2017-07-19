class AddUserToVotes < ActiveRecord::Migration[5.1]
  def up
    add_column :votes, :user_id, :integer, null: false
  end
  def down
    remove_column :votes, :user_id
  end
end
