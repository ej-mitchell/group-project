require 'spec_helper'
require 'rails_helper'

feature "sign in" do

    scenario 'an exiting user specifies a valid email and password' do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Sign Out')
    end
    scenario 'a nonexistent email and password is supplied'do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: 'nobody@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(page).to have_content('Invalid Email or password.')
      expect(page).to_not have_content('Signed in successfully.')
      expect(page).to_not have_content('Sign Out')
    end
    scenario 'a existing email with the wrong password is denied'
    scenario 'an already authenticated user cannot re-sign in'


  end
