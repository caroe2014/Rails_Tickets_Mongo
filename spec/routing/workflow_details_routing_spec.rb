require "rails_helper"

RSpec.describe WorkflowDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/workflow_details").to route_to("workflow_details#index")
    end

    it "routes to #new" do
      expect(:get => "/workflow_details/new").to route_to("workflow_details#new")
    end

    it "routes to #show" do
      expect(:get => "/workflow_details/1").to route_to("workflow_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/workflow_details/1/edit").to route_to("workflow_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/workflow_details").to route_to("workflow_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/workflow_details/1").to route_to("workflow_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/workflow_details/1").to route_to("workflow_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/workflow_details/1").to route_to("workflow_details#destroy", :id => "1")
    end

  end
end
