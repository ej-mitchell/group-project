require 'rails_helper'

describe Vote do

  it { should have_valid(:value).when(1) }
  it { should belong_to(:review) }
  it { should belong_to(:user) }

  it { should_not have_valid(:value).when(nil, '', 6) }
  it { should_not have_valid(:review).when(nil) }
  it { should_not have_valid(:user).when(nil) }

end

describe 'Vote' do
  context 'creates an upvote or a downvote' do
    let(:user){ FactoryGirl.build(:user) }
    let(:book) { Book.new(title: "Game of Thrones", author: "George R.R. Martin", page_number: 800, summary: "First book in the Song of Ice and Fire series.", cover_photo: "https://images-na.ssl-images-amazon.com/images/I/51bcsc2fcFL.jpg", user: user) }
    let(:review) { Review.new(rating: "3", text_body: "Oh em geeee, it was so gooood.", book: book) }
    let(:vote) { Vote.new(value: 1, review: review, user: user) }

    it 'is associated with a review and a book' do
      expect(vote.review.id).to be(review.id)
      expect(vote.review.book.id).to be(review.book.id)
    end
    it 'has a value corresponding to upvote or downvote' do
      expect(vote.value).to be(1)
    end

    it 'is associated with a user' do
      expect(vote.user.id).to be(user.id)
    end
  end
end
