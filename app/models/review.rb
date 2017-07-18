class Review < ApplicationRecord
  # belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :rating, numericality: true
  validates :text_body, presence: true
  validates :text_body, length: { minimum: 4, maximum: 2000 }
  validates :book_id, presence: true
end
