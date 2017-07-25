class AddCoverPhotoToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :cover_photo, :string
  end
end
