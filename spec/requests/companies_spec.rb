require 'rails_helper'

RSpec.describe "Company", type: :request do
  before(:all) do
    DatabaseCleaner.start
  end
  
  after(:all) do
    DatabaseCleaner.clean
  end  
  

  
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /companies/new" do
     it "works! (now write some real specs)" do
       

       get new_company_path(@company)
       expect(response).to have_http_status(200)
             
     end
  end
end
