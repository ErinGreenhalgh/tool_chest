require 'rails_helper'

RSpec.feature "user can only see their tools" do
  scenario "they see their tools after logging in" do
    user = User.create(username: "Erin", password: "password")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user_tool = user.tools.create(name: "saw", price: "10.99", quantity: "12")
    random_tool = Tool.create(name: "thing", price: "1.99", quantity: "11")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Log In"



    visit user_path(user.id)

    within("li:first") do
      expect(page).to have_content(user_tool.name)
      expect(page).to have_content(user_tool.price)
      expect(page).to have_content(user_tool.quantity)

      expect(page).not_to have_content(random_tool.name)
      expect(page).not_to have_content(random_tool.price)
      expect(page).not_to have_content(random_tool.quantity)
    end

  end
end
