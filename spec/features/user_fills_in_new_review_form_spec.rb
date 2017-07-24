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
end
