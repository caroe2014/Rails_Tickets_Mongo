require "rails_helper"

RSpec.feature "Add Company" do
  scenario "allow a user to add a company" do
    visit new_company_path
    fill_in "Name", with: "Cargill de Venezuela"
    fill_in "Phone", with: "414-555-5676"
    fill_in "Webpage", with: "www.cargillvenezuela.com"
    fill_in "Contact", with: "Petronila Bencomo"
    fill_in "Address1", with: "Torre Parque Cristal"
    fill_in "Address2", with: "Piso 10"
    fill_in "City", with: "Caracas"
    fill_in "State", with: "D.F."
    fill_in "Country", with: "Venezuela"
    
    click_on("Create Company")
    
    expect(page).to have_content("Cargill de Venezuela")
    expect(page).to have_content("414-555-5676")
    expect(page).to have_content("www.cargillvenezuela.com")
    expect(page).to have_content("Petronila Bencomo")
    expect(page).to have_content("Torre Parque Cristal")
    expect(page).to have_content("Piso 10")
    expect(page).to have_content("Caracas")
    expect(page).to have_content("D.F.")
    expect(page).to have_content("Venezuela")
  end
end
