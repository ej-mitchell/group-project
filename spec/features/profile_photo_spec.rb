require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Username', with: 'JonSmith'
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "user_password", with: "boomstick!3vilisd3ad"
    fill_in "Password Confirmation", with: "boomstick!3vilisd3ad"
    attach_file 'user_profile_photo', "#{Rails.root}/spec/support/images/photo.jpg"
    click_button "Sign Up"
    
    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign Out")
    expect(page).to have_css("img[src*='photo.jpg']")

  end
end
