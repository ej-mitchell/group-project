require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:book) { Book.create(title: "A book", author: "Jamie C", page_number: 800, summary: "ONKSDFJLKSDWEOIFJLKSDJFLS", user_id: user.id )}
  let!(:book2) { Book.create(title: "A second book", author: "Jamie C Again", page_number: 801, summary: "ONKSDFJLKSDWEOIFJLKSDJFLST", user_id: user.id )}
  let!(:review) { Review.create(book_id: book.id, user_id: user.id, rating: "1", text_body: "FANTASTICCCCCCCCCCCCCC") }

  describe 'GET#index' do
    it 'should return a list of all books' do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json['books'].length).to eq 2
      expect(returned_json['books'][0]["user_id"]).to eq user.id
      expect(returned_json['books'][0]["summary"]).to eq "ONKSDFJLKSDWEOIFJLKSDJFLS"

      expect(returned_json['books'][1]["user_id"]).to eq user.id
      expect(returned_json['books'][1]["summary"]).to eq "ONKSDFJLKSDWEOIFJLKSDJFLST"
    end
  end

  describe 'GET#show', pending: true do
    it 'should return a specific book and related reviews' do
      get :show, id: book.id
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

    end
  end
end
