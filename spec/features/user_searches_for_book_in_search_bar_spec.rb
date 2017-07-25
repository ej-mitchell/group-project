require 'rails_helper'

feature 'user fills in search bar' do

  scenario 'search bar is present' do
    user = FactoryGirl.create(:user)
    book = Book.create(title: "Bob", author: "Saget", page_number: 800, summary: "A book about Bob.", user_id: user.id)

    visit books_path

    expect(page).to have_button('Search')
  end

  scenario 'user can find a title' do
    user = FactoryGirl.create(:user)
    book = Book.create(title: "Bob", author: "Saget", page_number: 800, summary: "A book about Bob.", user_id: user.id)
    visit books_path

    fill_in 'search', with: book.title
    click_button('Search')
    expect(page).to have_content(book.title)
  end

  scenario 'user does not find title if no book matches' do
    user = FactoryGirl.create(:user)
    book = Book.create(title: "Bob", author: "Saget", page_number: 800, summary: "A book about Bob.", user_id: user.id)

    visit books_path

    fill_in 'search', with: "Legs"
    click_button('Search')
    expect(page).to_not have_content(book.title)
  end

end
