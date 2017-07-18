class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :book
      t.string :rating, null: false
      t.text :text_body, null: false
    end
  end
end
