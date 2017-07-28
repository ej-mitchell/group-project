class ReviewSerializer < ActiveModel::Serializer
  attributes :book, :id, :book_id, :rating, :text_body, :username, :user_id, :created_at
end
