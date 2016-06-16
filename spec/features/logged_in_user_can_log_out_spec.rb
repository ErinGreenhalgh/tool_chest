require 'rails_helper'

RSpec.feature "logged in user can log out" do
  scenario "they see the link to log out" do
    user = User.create(username: "Erin", password: "password")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Log In"

    click_link "Log Out"

    expect(page).not_to have_content("Log Out")
    expect(page).to have_content("Log In")
  end
end
