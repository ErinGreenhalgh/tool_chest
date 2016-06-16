require 'rails_helper'

RSpec.feature do
#another way to write it: RSpec.describe "Tool management", type: :feature
  scenario "user creates a new tool" do
    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: 10.99
    fill_in "tool[quantity]", with: 10
    #can always select a field based on its name attribute; this is an alternate way to select a thing

    find(:button, "Create Tool").click #preferred over click_button syntax
    #can also do first(:button, "Create Tool").click; be comfortable in doing things in s few different ways

    expect(current_path).to eq(tool_path(Tool.last.id))
    #flipped from minitest assertions
    #this thing we created will be the last thing in the db so we can find it that way

    within("h1") do
      #we are expecting to find a tool info class on the page
      #can scope down further and further (".tool_info li")
      #(".tool_info li:nth-child(1)") ==> find the first item in the list w/in class tool_info
      expect(page).to have_content("Screwdriver")
      expect(page).to have_content("InStock: 10")
    end

    within("h3") do
      expect(page).to have_content("$10.99")
    end

   #easy to get false positives, lets say if user ID is displayed on the page and it happens to be 10

    #pseudocode test:
      #visit a page with the form to create a new tool
      #fill in the attributes for the tool (name, price, quartity)
      #submit the form
      #be redirected to the tool show page
      #make sure all the attributes I filled in and submitted are displaying on the page
  end
end
