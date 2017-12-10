require 'rails_helper'

RSpec.describe "JobStates", type: :request do
  describe "GET /job_states" do
    it "works! (now write some real specs)" do
      get job_states_path
      expect(response).to have_http_status(200)
    end
  end
end
