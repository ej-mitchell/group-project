class Review < ApplicationRecord
STARS = [
  ["1 Star", 1],
  ["2 Stars", 2],
  ["3 Stars", 3],
  ["4 Stars", 4],
  ["5 Stars", 5]
]

  belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :text_body, presence: true
  validates :text_body, length: { minimum: 4, maximum: 2000 }
  validates :book_id, presence: true
end
