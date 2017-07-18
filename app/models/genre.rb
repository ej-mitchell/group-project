class Genre < ApplicationRecord
  has_many :bookgenres

  validates :name, presence: true, uniqueness: true
end
