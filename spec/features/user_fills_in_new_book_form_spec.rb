require 'rails_helper'
=begin
[] If I am authenticated, I can fill in the new book form
[] When I submit the new book form, I will be redirected to the book's show page
[] If I am missing information, there will be errors at the top of the form.
=end

feature 'user fills out new book form' do
  scenario 'user fills in information' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit new_book_path

    fill_in "Title", with: "a title"
    fill_in "Author", with: "some author"
    fill_in "Number of Pages", with: 800
    fill_in "Summary", with: "This is a great book!!!!"

    click_button "Submit"

    expect(page).to have_content("a title")
  end

  scenario 'user submits without filling in information' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit new_book_path

    click_button "Submit"
    expect(page).to have_content("can't be blank")
  end
end
