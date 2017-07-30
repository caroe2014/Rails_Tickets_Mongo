require "rails_helper"

RSpec.feature "Add New Ticket" do
  scenario "Navigate de menu" do
    visit root_path
    visit projects_path
    visit new_printing_ticket_path
    
    fill_in "name", with: "5000611"
    fill_in "subname", with: "L444555777"
    fill_in "description", with: "Test"
    fill_in "width", with: 120
    fill_in "height", with: 90
    fill_in "qty", with: 10
    fill_in "single", with: true
    fill_in "double", with: false
    fill_in "locations_id", with: "596c38009f911d0473842ee1"
    fill_in "material_id", with: "596ed6fa9f911d035f35662f"
    fill_in "equipment_id", with: "596ef2949f911d046be41211"
    fill_in "project_id", with: "5933821a9f911d07c066fb24"
    
    click_on("Create Priting Ticket")
    
    expect(page).to have_content("5000611")
    expect(page).to have_content("L444555777")
    expect(page).to have_content("Test")
    expect(page).to have_content(120)
    expect(page).to have_content(90)
    expect(page).to have_content(10)

  end
end
