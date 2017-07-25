class Book < ApplicationRecord

  mount_uploader :cover_photo, CoverPhotoUploader

  belongs_to :user
  has_many :bookgenres
  has_many :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :page_number, presence: true
  validates :page_number, numericality: true
  validates :summary, length: { minimum: 10, maximum: 2000 }
  validates :user_id, presence: true
end
