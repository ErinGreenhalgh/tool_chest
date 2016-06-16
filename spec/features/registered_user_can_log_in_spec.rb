require 'rails_helper'

RSpec.feature "registered user can log in" do
  scenario "they enter their name and password" do
    user = User.create(username: "Erin", password: "password")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Log In"

    expect(current_path).to eq(user_path(user))

    within('#welcome') do
      expect(page).to have_content("Welcome, #{user.username}!")
    end
  end

end
