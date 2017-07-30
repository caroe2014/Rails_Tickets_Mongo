require 'rails_helper'

RSpec.describe "LocalMaterials", type: :request do
  describe "GET /local_materials" do
    it "works! (now write some real specs)" do
      get local_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
