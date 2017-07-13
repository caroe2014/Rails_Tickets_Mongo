require 'rails_helper'

RSpec.describe "MasterMaterials", type: :request do
  describe "GET /master_materials" do
    it "works! (now write some real specs)" do
      get master_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
