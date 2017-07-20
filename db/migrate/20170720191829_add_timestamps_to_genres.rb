class AddTimestampsToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :created_at, :datetime, null: false
    add_column :genres, :updated_at, :datetime, null: false
  end
end
