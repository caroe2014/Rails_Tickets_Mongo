require "rails_helper"
require "spec_helper"

feature "verifying ticket controller", js: true do
   before(:all) do
      DatabaseCleaner.start
      
      @user = User.create!(first_name: "Edwin", 
                           last_name: "Caro",
                           cellphone: "555-777-9999", 
                           token_id: "yrpX1Acz6eMugH9HQZRRdiM9HfdwuI2IKgFgz2EARKtqlYo2DY", 
                           email: "edwin.caro@freemanco.com",
                           password: "1dv1vvdu", 
                           encrypted_password: "$2a$11$psCt67ZaL79fY9xPfy/1T.u4zXeXHere9loSTDINsYZ4lmuOcAmAy", 
                           sign_in_count: 104, 
                           last_sign_in_ip: "::1", 
                           current_sign_in_ip: "::1")

    @company = Company.create!(name: "Testing Company LLC",
                               nickname: "TCLLC",
                               city: "Testing City",
                               state: "Testing State",
                               country: "Testing Country")

     @project = Project.create!(name: "Project testing 2017",
                    company_id: @company._id,
                    nickname: "PT17",
                    project_number: 12345,
                    status: 1,
                    client: "Testing Looser LLC",
                    phone: "555-666-9999",
                    project_manager: "testing Person")

#     @project2 = Project.create!(name: "Project testing 2018",
#                    company_id: @company._id,
#                    nickname: "PT18",
#                    project_number: 12345,
#                    status: 1,
#                    client: "Testing Looser LLC",
#                    phone: "555-666-9999",
#                    project_manager: "testing Person")

     @printing_ticket = PrintingTicket.create!(name: "WT10500",
                                               subname: "LI10500",
                                               description: "GROMMETS ALL 4 SIDES",
                                               width: 120.0,
                                               height: 96.0,
                                               qty: 5,
                                               single: true,
                                               double: false,
                                               project_id: @project._id)

#     @printing_ticket2 = PrintingTicket.create!(name: "WT10600",
#                                               subname: "LI10600",
#                                               description: "GROMMETS ALL 4 SIDES",
#                                               width: 96.0,
#                                               height: 120.0,
#                                               qty: 10,
#                                               single: true,
#                                               double: false,
#                                               project_id: @project2._id)


     @master_group = MasterGroup.create!(name: "admin",
                                         status: 1)

     @company_group = CompanyGroup.create!(company_id: @company._id,
                                            user_id: @user._id,
                                            mastergroup_id: @master_group._id)                                                                           

     @location = Location.create!(company_id: @company._id,
                                  name: "Testing Location",
                                  shortname: "TL",
                                  contact_name: "Contact Person")
     
     @local_material = LocalMaterial.create!(location_id: @location._id,
                                             name: "Testinf Material")
                                                                                
     @local_equipment = LocalEquipment.create!(location_id: @location._id,
                                               name: "Testing equipment",
                                               equipment_type: "Printer")
     @job_state = JobState.create!(name: "In Layout",
                                   color: "yellow",
                                   step_number: 10,
                                   status: 1)                                          
   end
   
   before(:each) do
     visit "/main_menus/home"
   end

   after(:all) do
       DatabaseCleaner.clean
   end

  scenario "check login" do    
   
    expect(page).to have_content("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    
    fill_in "Email", with: "edwin.caro@freemanco.com"
    fill_in "Password", with: "1dv1vvdu"
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully")
  end
  
  scenario "Check header" do
    visit "/main_menus/home"
    fill_in "Email", with: "edwin.caro@freemanco.com"
    fill_in "Password", with: "1dv1vvdu"
    click_button 'Log in'
    visit projects_path
    expect(page).to have_content("PT17   12345")
    expect(page).to have_content("Testing Company LLC")
    expect(page).to have_content("edwin.caro@freemanco.com")
#    expect(page.all("tr td a").count).to eq(8)
    
#    click_link(("List Rails Tickets"))
    
#    expect(page).to have_content("WT10500")
  end
    
end
