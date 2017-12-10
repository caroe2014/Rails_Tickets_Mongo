require "rails_helper"

RSpec.describe WorkflowMastersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/workflow_masters").to route_to("workflow_masters#index")
    end

    it "routes to #new" do
      expect(:get => "/workflow_masters/new").to route_to("workflow_masters#new")
    end

    it "routes to #show" do
      expect(:get => "/workflow_masters/1").to route_to("workflow_masters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/workflow_masters/1/edit").to route_to("workflow_masters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/workflow_masters").to route_to("workflow_masters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/workflow_masters/1").to route_to("workflow_masters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/workflow_masters/1").to route_to("workflow_masters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/workflow_masters/1").to route_to("workflow_masters#destroy", :id => "1")
    end

  end
end
