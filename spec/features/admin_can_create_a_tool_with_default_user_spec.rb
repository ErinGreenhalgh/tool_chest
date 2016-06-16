require "rails_helper"

RSpec.feature "admin can create a tool with default user" do
  scenario "they create a tool" do
    pending
    #there is a user with a role of admin
    #they are logged in
    #they create a tool
    #they assign the user role
    #visit the tools index and see the tool
    user = User.create(username: "User", password: "hello", role: 0)

    admin = User.create(username: "Erin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    #admin can view all users
    #select user from dropdown of all the users to assign it to tool in form
    visit new_tool_path
    fill_in "Name", with: "saw"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "2"
    select user.username, from: "User"

    click_button "Create Tool"
    visit tools_path
    expect(page).to have_content("saw")
    expect(page).to have_content("This tool belongs to #{user}")
  end

end
