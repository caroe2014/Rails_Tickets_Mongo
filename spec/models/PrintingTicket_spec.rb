require 'rails_helper'

RSpec.describe PrintingTicket, type: :model do
  before(:all)do
    DatabaseCleaner.start
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
                    client: "Testing Company Inc",
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

  end

  after(:all) do
      DatabaseCleaner.clean
  end  
    it "la Compania deberia existir en test" do
    expect(@company.name).to eq("Testing Company LLC")
  end


  it "la Compania deberia tener un proyecto" do
    expect(@project.nickname).to eq("PT17")
  end
  
  it "Deberia Existir un ticket" do
    expect(@printing_ticket.name).to eq("WT10500")
  end
  
  it "The ticket belongs to the project" do
    expect(@printing_ticket.project_id).to eq(@project._id) 
  end
  
  it "THe Project belongs to the company" do
    expect(@project.company_id).to eq(@company._id) 
  end

  
end
