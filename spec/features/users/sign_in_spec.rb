require 'rails_helper'

feature 'user signs in' do

  let(:user) { User.create(
    first_name: 'first',
    last_name: 'last',
    email: 'whateever@yahoo.com',
    password: 'password',
    password_confirmation: 'password'
  )}

  scenario 'user enters correct email and password' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'user supplies incorrect email' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: "wrongemail"
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign In')
  end

  scenario 'user sees profile picture after sign in' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')
    page.find('#profile-picture')['src'].should have_content '/assets/fallback/profile_default-ca7c83d4283250d25a9389e52370105ee6df28fa09a7b749e6de485ee8cb030c.png'
  end

  scenario 'user supplies incorrect password' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongPassword'
    click_button 'Sign In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign In')
  end


  scenario 'user can not sign in when already signed in' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit new_user_session_path

    expect(page).to have_content('You are already signed in.')
  end
end
