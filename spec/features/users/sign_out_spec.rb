require 'rails_helper'

feature 'user signs out' do

  let(:user) { User.create(
    first_name: 'fist',
    last_name: 'last',
    email: 'whateever@yahoo.com',
    password: 'password',
    password_confirmation: 'password'
  )}

  scenario 'user signs out successfully' do

    visit root_path
    sign_in_as(user)

    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')

    expect(page).to have_content('Sign In')

  end

end
