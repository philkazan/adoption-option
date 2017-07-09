require "rails_helper"

feature "user can edit profile" do
  scenario "user visits profile page and edits profile" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(user)
    click_link "Edit Profile"

    fill_in 'Email', with: 'differentemail@example.com'

    fill_in 'Current password', with: user.password

    click_button 'Save Changes'

    visit user_path(user)

    expect(page).to have_content( 'differentemail@example.com')
  end

  scenario "user visits profile page and unsuccessfully edits profile" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(user)
    click_link "Edit Profile"

    fill_in 'Email', with: ''

    click_button 'Save Changes'

    expect(page).to have_content( 'Email is invalid')
    expect(page).to have_content( 'Email can\'t be blank')
    expect(page).to have_content( 'Current password can\'t be blank')
  end
end
