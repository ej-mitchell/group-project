require 'rails_helper'

feature 'admin can delete a book from a list of books' do
  scenario 'admin can see link to all books at the top of the homepage when they sign in' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    visit root_path

    expect(page).to have_link("All Books")
  end

  scenario 'admin clicks link All Books and is redirected to a delete page' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    book = FactoryGirl.create(:book, user: user)
    visit root_path
    click_link "All Books"

    expect(page).to have_content("Book Burning Page")
    expect(page).to have_content(book.title)
  end

  scenario 'admin can burn books' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    book = FactoryGirl.create(:book, user: user)
    visit root_path
    click_link "All Books"

    click_button "Burn Book"
    expect(page).to have_content("Book has been burned.")
    expect(page).to_not have_content(book.title)
  end
end
