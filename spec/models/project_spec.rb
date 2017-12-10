require 'rails_helper'

RSpec.describe Project, type: :model do
   before(:all) do
      DatabaseCleaner.start
#      @company = Company.create!(name: "Testing Company LLC",
#                                 nickname: "TCLLC",
#                                 city: "Testing City",
#                                 state: "Testing State",
#                                 country: "Testing Country")

      @company = FactoryBot.create(:company, :name => "Testing Company LLC")
 
      @project = FactoryBot.create(:project, :company_id => @company_id, :nickname => "PT17")
   end

   after(:all) do
       DatabaseCleaner.clean
   end
    
    it "Debe existing una compania" do
      expect(@company.name).to eq("Testing Company LLC")
    end
    it " Debe existe un project " do
      expect(@project.nickname).to eq("PT17")
    end
  
end
