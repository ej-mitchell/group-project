require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:book) { Book.create(title: "A book", author: "Jamie C", page_number: 800, summary: "ONKSDFJLKSDWEOIFJLKSDJFLS", user_id: user.id )}
  let!(:review) { Review.create(book_id: book.id, user_id: user.id, rating: "1", text_body: "FANTASTICCCCCCCCCCCCCC") }
  let!(:review2) { Review.create(book_id: book.id, user_id: user.id, rating: "5", text_body: "FANTASTICCCCCCCCCCCCCC") }

  describe 'GET#index' do
    it 'should return a list of all reviews' do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 2
      expect(returned_json[0]["user_id"]).to eq user.id
      expect(returned_json[0]["book_id"]).to eq book.id
      expect(returned_json[0]["rating"]).to eq '1'
      expect(returned_json[0]["text_body"]).to eq 'FANTASTICCCCCCCCCCCCCC'

      expect(returned_json[1]["user_id"]).to eq user.id
      expect(returned_json[1]["book_id"]).to eq book.id
      expect(returned_json[1]["rating"]).to eq '5'
      expect(returned_json[1]["text_body"]).to eq 'FANTASTICCCCCCCCCCCCCC'
    end
  end
end
