require "rails_helper"

RSpec.feature "default user cannot update other users" do
  context "they can update themself" do
    scenario "they see the form to update their information" do
      user = User.create(username: "Erin", password: "password", role: 0)
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user)

      new_name = "Awesome Lady"
      new_password = "hello"

      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.last)
      visit edit_user_path(User.last)

      fill_in "Username", with: new_name
      fill_in "Password", with: new_password
      click_button "Update Your User Information"

      expect(current_path).to eq user_path(user)
      expect(page).to have_content(new_name)
      expect(page).not_to have_content("Erin")
    end
  end

  context "they can't update another user" do

  end

end
