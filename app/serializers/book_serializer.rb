class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :page_number, :average_rating, :summary, :cover_photo, :created_at, :user_id
end
