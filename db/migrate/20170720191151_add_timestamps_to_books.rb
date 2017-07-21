class AddTimestampsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :created_at, :datetime, null: false
    add_column :books, :updated_at, :datetime, null: false
  end
end
