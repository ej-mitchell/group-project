class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :text_body, presence: true
  validates :text_body, length: { minimum: 4, maximum: 2000 }
  validates :book_id, presence: true
end
