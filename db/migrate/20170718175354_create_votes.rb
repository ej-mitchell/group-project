class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to :review, null: false
      t.integer :value, null: false, default: 0
    end
  end
end
