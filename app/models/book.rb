class Book < ApplicationRecord
  belongs_to :user
  has_many :bookgenres
  has_many :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :page_number, presence: true
  validates :page_number, numericality: true
  validates :summary, length: { minimum: 10, maximum: 2000 }
  validates :cover_url, presence: true
  validates :user_id, presence: true

  def self.search(search)
    if search
      books = Book.all
      search_results = books.where(['title ILIKE ?', "%#{search}%"])
    else

    end
  end
end
