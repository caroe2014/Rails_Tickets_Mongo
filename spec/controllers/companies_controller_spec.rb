require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
     it "assigns @companies" do

      company = Company.create(name: "Testing Company LLC",
                                 nickname: "TCLLC",
                                 city: "Testing City",
                                 state: "Testing State",
                                 country: "Testing Country")       
       get :index
      expect(assigns(:companies)).to eq([company])
     end
  end

end
