class Bookgenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre

  validates :genre_id, presence: true
  validates :book_id, presence: true
end
