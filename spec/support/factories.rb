FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "title#{n}" }
    author "a random author"
    page_number 800
    summary "a summary with lots of words"
  end
end
