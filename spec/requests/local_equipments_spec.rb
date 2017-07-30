require 'rails_helper'

RSpec.describe "LocalEquipments", type: :request do
  describe "GET /local_equipments" do
    it "works! (now write some real specs)" do
      get local_equipments_path
      expect(response).to have_http_status(200)
    end
  end
end
