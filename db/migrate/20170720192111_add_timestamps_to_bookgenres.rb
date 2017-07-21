class AddTimestampsToBookgenres < ActiveRecord::Migration[5.1]
  def change
    add_column :bookgenres, :created_at, :datetime, null: false
    add_column :bookgenres, :updated_at, :datetime, null: false
  end
end
