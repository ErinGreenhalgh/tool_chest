require 'rails_helper'

RSpec.feature "default user can only see their tools" do
  context "they can see all their tools and tool show page" do
    scenario "they see tools they created" do
      user1 = User.create(username: "Larry", password: "password", role: 0)
      user2 = User.create(username: "Lenny", password: "hello", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user1 )

      user1.tools.create(name: "saw", price: "10.99", quantity: "12")
      user2.tools.create(name: "rake", price: "13.00", quantity: "4")
      visit user_path(user1)

      expect(page).to have_content("saw")
      expect(page).to have_link("saw", href: tool_path(user1.tools.find_by(name: "saw")))
      expect(page).not_to have_content("rake")
    end
  end
end
