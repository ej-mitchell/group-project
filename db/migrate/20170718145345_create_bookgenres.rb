class CreateBookgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :bookgenres do |t|
      t.belongs_to :book, null: false
      t.belongs_to :genre, null: false
    end
  end
end
