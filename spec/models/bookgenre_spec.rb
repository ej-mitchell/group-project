require "rails_helper"

RSpec.describe 'Bookgenre' do
  context 'makes a relation between book and genre' do
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_url: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg") }
    let(:genre) { Genre.new(name: "Mystery")}
    let(:bookgenre) { Bookgenre.new(book: book, genre: genre)}

    it 'has a book id and a genre id' do
      expect(bookgenre.book.id).to be(book.id)
      expect(bookgenre.genre.id).to be(genre.id)
    end

  end
end
