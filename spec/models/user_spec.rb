require 'rails_helper'


RSpec.describe Project, type: :model do
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
                    client: "Testing Company LLC",
                    phone: "555-666-9999",
                    project_manager: "testing Person")

     @printing_ticket = PrintingTicket.create!(name: "WT10500",
                                               subname: "LI10500",
                                               description: "GROMMETS ALL 4 SIDES",
                                               width: 120.0,
                                               height: 96.0,
                                               qty: 5,
                                               single: true,
                                               double: false,
                                               project_id: @project._id)

     @master_group = MasterGroup.create!(name: "admin",
                                         status: 1)

     @company_group = CompanyGroup.create!(company_id: @company._id,
                                            user_id: @user._id,
                                            mastergroup_id: @master_group._id)                                                                           

   end

   after(:all) do
       DatabaseCleaner.clean
   end
   
    it "debe existir un usuario" do
       expect(@user.first_name).to eq("Edwin")
    end
      
    it "Debe existir una compania" do
      expect(@company.name).to eq("Testing Company LLC")
    end
    it " Debe existe un project " do
      expect(@project.nickname).to eq("PT17")
    end
    it "debe existir un work ticket" do
      expect(@printing_ticket.name).to eq("WT10500")
    end
    it "debe existir un masterGroup" do
      expect(@master_group.name).to eq("admin")
    end
  
end
