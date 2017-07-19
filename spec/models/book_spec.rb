require "rails_helper"

describe Book do
  it { should have_valid(:title).when('a title') }
  it { should have_valid(:author).when('author') }
  it { should have_valid(:page_number).when(200) }
  it { should have_valid(:summary).when('more words here') }
  it { should have_valid(:cover_url).when('https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg') }
  it { should have_valid(:user_id).when(1, 2, 300) }

  it { should_not have_valid(:title).when(nil, '') }
  it { should_not have_valid(:author).when(nil, '') }
  it { should_not have_valid(:page_number).when(nil, '') }
  it { should_not have_valid(:summary).when(nil, '', 'good') }
  it { should_not have_valid(:cover_url).when(nil, '') }
  it { should_not have_valid(:user_id).when(nil, '') }
end

RSpec.describe 'Book' do
  context 'making a new book' do
    let(:user){ FactoryGirl.build(:user) }
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_url: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg", user_id: user.id) }

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

    it 'has a user associated with it' do
      expect(book.user_id).to be(user.id)
    end
  end
end
