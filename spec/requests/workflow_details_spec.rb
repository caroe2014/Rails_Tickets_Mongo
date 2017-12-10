require 'rails_helper'

RSpec.describe "WorkflowDetails", type: :request do
  describe "GET /workflow_details" do
    it "works! (now write some real specs)" do
      get workflow_details_path
      expect(response).to have_http_status(200)
    end
  end
end
