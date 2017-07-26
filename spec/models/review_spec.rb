require 'rails_helper'

describe Review do
  it { should have_valid(:rating).when('1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars') }
  it { should have_valid(:text_body).when('words') }
  it { should belong_to(:book) }
  it { should belong_to(:user) }

  it { should_not have_valid(:text_body).when(nil, '', 'hi') }
  it { should_not have_valid(:book).when(nil) }
  it { should_not have_valid(:user).when(nil) }
end

describe 'Review' do
  context 'create a book review' do
    let(:user){ FactoryGirl.build(:user) }
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_url: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg", user: user) }
    let(:review) { Review.new(rating: "3 Stars", text_body: "Oh em geeee, it was so gooood.", book: book, user: user) }

    it 'has a rating and text' do
      expect(review.rating).to include("3 Stars")
      expect(review.text_body).to include("Oh em geeee")
    end

    it 'is associated with a book and a user' do
      expect(review.book.id).to be(book.id)
      expect(review.user.id).to be(user.id)
    end
  end
end
