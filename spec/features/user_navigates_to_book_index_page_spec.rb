require 'rails_helper'

=begin
[] As a user (regardless of authentication), I can navigate from the home page
to the books index page.
[] If I am authenticated, I can click on a link to add a book.
[] If I am not authenticated, clicking the add new book link will send me
to the sign up page
=end

feature 'user navigates books index page' do
  # **when we have all pages up and tested these tests will be uncommented**
  # scenario 'user navigates from home index page to books index page', pending: true do
  #   visit root_path #this is not set up yet in the master
  #   click_link 'Books'
  #
  #   expect(page).to have('Book List')
  #   expect(page).to have_link('Add Book')
  # end

  scenario 'an *authenticated* user clicks on add-book link' do
    visit books_path
    click_link 'Add Book'

    expect(page).to have_content('Add New Book Form')
  end

  # scenario 'an *unauthenticated* user clicks on add-book link', pending: true do
  #   visit books_path
  #   click_link 'Add Book'
  #
  #   expect(page).to have_content('Sign Up')
  # end

end
