require 'rails_helper'

RSpec.describe Company, type: :model do
  describe name do
     DatabaseCleaner.start
     let(:company) {
     @company = Company.create!(nickname: "TCLLC",
                                city: "Testing City",
                                state: "Testing State",
                                country: "Testing Country")
     
     }
     after(:all) do
       DatabaseCleaner.clean
     end
    
     it "Prevent name blank or nil" do
       expect {
         company.update_attributes(:name, :city, :state, :country)
       }.to raise_error(Mongoid::Errors::Validations, "Company can't be blank")
     end
  end
end
