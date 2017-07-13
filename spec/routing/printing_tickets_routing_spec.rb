require "rails_helper"

RSpec.describe PrintingTicketsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/printing_tickets").to route_to("printing_tickets#index")
    end

    it "routes to #new" do
      expect(:get => "/printing_tickets/new").to route_to("printing_tickets#new")
    end

    it "routes to #show" do
      expect(:get => "/printing_tickets/1").to route_to("printing_tickets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/printing_tickets/1/edit").to route_to("printing_tickets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/printing_tickets").to route_to("printing_tickets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/printing_tickets/1").to route_to("printing_tickets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/printing_tickets/1").to route_to("printing_tickets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/printing_tickets/1").to route_to("printing_tickets#destroy", :id => "1")
    end

  end
end
