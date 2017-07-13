require 'rails_helper'

RSpec.describe "PrintingTickets", type: :request do
  describe "GET /printing_tickets" do
    it "works! (now write some real specs)" do
      get printing_tickets_path
      expect(response).to have_http_status(200)
    end
  end
end
