require 'rails_helper'

feature 'user fills out new review form' do
  scenario 'user fills in information' do
    user = FactoryGirl.create(:user)
    book = Book.create(title: "Bob", author: "Saget", page_number: 800, summary: "A book about Bob.", user_id: user.id)

    login_as(user, :scope => :user)

    visit new_book_review_path(book)

    select(3, from: "Rating")
    fill_in "Text Body", with: "some comment"

    click_button "Submit"

    expect(page).to have_content("Review was added successfully!")
  end

  scenario 'user submits without filling in information' do
    user = FactoryGirl.create(:user)
    book = Book.create(title: "Bob", author: "Saget", page_number: 800, summary: "A book about Bob.", user_id: user.id)

    login_as(user, :scope => :user)

    visit new_book_review_path(book)

    click_button "Submit"
    expect(page).to have_content("can't be blank")
  end

  scenario "review a book" do
    #Clear out any previously delivered emails
    ActionMailer::Base.deliveries.clear

    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book, user: other_user)

    login_as(user, :scope => :user)

    visit new_book_review_path(book)

    select("4 Stars", from: "Rating")
    fill_in "Text Body", with: "This is a good book."

    click_button "Submit"

    expect(page).to have_content("Review was added successfully!")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
