require 'spec_helper'

feature 'sign up' do

  scenario 'specifying required info without avatar' do

    visit new_user_registration_path
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("You have successfully signed up!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'specifying require info with an avatar' do

    visit new_user_registration_path
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file("Avatar","#{Rails.root}/spec/fixtures/sample.jpg")
    click_button 'Sign Up'

    expect(page).to have_content("You have successfully signed up!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'user specifies an invalid file type for avatar' do

    visit new_user_registration_path
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Wayne'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file("Avatar","#{Rails.root}/spec/fixtures/sample.pdf")

    click_button 'Sign Up'

    expect(page).to have_content(`Image You are not allowed to upload "pdf" \
      files, allowed types: jpg, jpeg, gif, png`)

  end



end
