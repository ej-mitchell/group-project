require 'rails_helper'

describe Review do
  it { should have_valid(:rating).when('1', '2', '3', '4', '5') }
  it { should have_valid(:text_body).when('words') }
  it { should belong_to(:book) }

  it { should_not have_valid(:rating).when(nil, '', '6', 7) }
  it { should_not have_valid(:text_body).when(nil, '', 'hi') }
  it { should_not have_valid(:book).when(nil) }
end

describe 'Review' do
  context 'create a book review' do
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_url: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg") }
    let(:review) { Review.new(rating: "3", text_body: "Oh em geeee, it was so gooood.", book: book) }

    it 'has a rating and text' do
      expect(review.rating).to include("3")
      expect(review.text_body).to include("Oh em geeee")
    end

    it 'is associated with a book' do
      expect(review.book.id).to be(book.id)
    end
  end
end
