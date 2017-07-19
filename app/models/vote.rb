class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :review_id, presence: true
  validates :value, numericality: true
  validates :value, inclusion: { in: [-1, 0, 1] }
  validates :user_id, presence: true
end
