require "rails_helper"

RSpec.feature "Add Company" do
  
  before(:all) do
    DatabaseCleaner.start
  end
  after(:all) do
    DatabaseCleaner.clean
  end  
    scenario "allow a user to add a company" do
      @company = FactoryBot.create(:company, :name => "Cargill de Venezuela")
      click_on("Create Company")
      visit company_path(@company)
    
    expect(page).to have_content(@company.name)
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
