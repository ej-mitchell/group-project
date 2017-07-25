class RemoveCoverUrlFromBooks < ActiveRecord::Migration[5.1]
  def up
    remove_column :books, :cover_url
  end

  def down
    remove_column :books, :cover_url, :string
  end
end
