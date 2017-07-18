class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :page_number, null: false
      t.string :average_rating, default: "0"
      t.text :summary, null: false
      t.string :cover_url, default: "http://webneel.com/sites/default/files/images/download/thumb/old-book-with-blank-cover%201_0.jpg"
    end
  end
end
