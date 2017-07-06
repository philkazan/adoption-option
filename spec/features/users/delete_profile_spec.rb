require "rails_helper"

feature "user can delete profile" do

  let!(:user) { User.create(first_name: 'user', last_name: 'user', email: 'user@email.com', password: 'password', password_confirmation: 'password', admin: false)}

  scenario "user visits profile page and deletes profile" do

    sign_in_as(user)
    id = user.id
    visit user_path(user)

    expect(page).to have_content "Delete Account"
    click_link "Delete Account"

    User.exists?(id).should be_falsey

    expect(page).to have_current_path(root_path)
  end
end
