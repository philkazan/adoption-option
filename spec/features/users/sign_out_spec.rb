require 'rails_helper'

feature 'user signs out' do
  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:user)
    
    visit root_path
    sign_in_as(user)

    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')

    expect(page).to have_content('Sign In')

  end

end
