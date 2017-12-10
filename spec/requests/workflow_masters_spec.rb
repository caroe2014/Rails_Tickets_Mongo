require 'rails_helper'

RSpec.describe "WorkflowMasters", type: :request do
  describe "GET /workflow_masters" do
    it "works! (now write some real specs)" do
      get workflow_masters_path
      expect(response).to have_http_status(200)
    end
  end
end
