class AddProfilePhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_photo, :string, null: false
  end
end
