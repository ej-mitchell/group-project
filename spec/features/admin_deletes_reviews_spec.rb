require 'rails_helper'

feature 'admin can delete a review from a list of reviews' do
  scenario 'admin can see link to all reviews at the top of the homepage when they sign in' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    book = FactoryGirl.create(:book, user: user)
    review = FactoryGirl.create(:review, user: user, book: book)

    visit root_path

    expect(page).to have_link("All Reviews")
  end

  scenario 'admin clicks link All Reviews and is redirected to a delete page' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    book = FactoryGirl.create(:book, user: user)
    review = FactoryGirl.create(:review, user: user, book: book)
    visit root_path
    click_link "All Reviews"

    expect(page).to have_content("Review Incinerator")
    expect(page).to have_content(review.text_body)
  end

  scenario 'admin can burn books' do
    user = FactoryGirl.create(:user, role: "admin")
    login_as(user, :scope => :user)
    book = FactoryGirl.create(:book, user: user)
    review = FactoryGirl.create(:review, user: user, book: book)
    visit root_path
    click_link "All Reviews"

    click_button "Incinerate"
    expect(page).to have_content("Review has been incinerated.")
    expect(page).to_not have_content(review.text_body)
  end
end
