require "rails_helper"
require "spec_helper"

feature "verifying ticket controller", js: true do
  scenario "Checkin index" do
    visit "/"
    expect(page).to have_content("Company Testing LLC")
    expect(page).to have_content("List of Tickets")
  end
end
