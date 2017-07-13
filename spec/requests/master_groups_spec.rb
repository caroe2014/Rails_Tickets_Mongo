require 'rails_helper'

RSpec.describe "MasterGroups", type: :request do
  describe "GET /master_groups" do
    it "works! (now write some real specs)" do
      get master_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
