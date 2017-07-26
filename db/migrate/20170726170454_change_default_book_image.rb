class ChangeDefaultBookImage < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :cover_url, :string, default: "http://cyclopaedia.org/mosaique/davis538black200.jpg"
  end
end
