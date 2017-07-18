require "rails_helper"

RSpec.describe 'Book' do
  context 'making a new book' do
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_url: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg") }

    it 'has a title and an author' do
      expect(book.title).to include("Game of Thrones")
      expect(book.author).to include("George R.R. Martin")
    end

    it 'has a page number' do
      expect(book.page_number).to be(800)
    end

    it 'has a summary' do
      expect(book.summary).to include("First book")
    end

    it 'has a cover URL' do
      expect(book.cover_url).to be_present
    end
  end
end
