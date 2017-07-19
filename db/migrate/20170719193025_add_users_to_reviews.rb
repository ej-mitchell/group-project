class AddUsersToReviews < ActiveRecord::Migration[5.1]
  def up
    add_column :reviews, :user_id, :integer, null: false
  end
  def down
    remove_column :reviews, :user_id
  end
end
