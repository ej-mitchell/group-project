FactoryGirl.define do
  factory :review do
    book_id 1
    user_id 1
    rating '3 Stars'
    text_body 'I am a review!'
  end
end
