require "rails_helper"

RSpec.describe JobStatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/job_states").to route_to("job_states#index")
    end

    it "routes to #new" do
      expect(:get => "/job_states/new").to route_to("job_states#new")
    end

    it "routes to #show" do
      expect(:get => "/job_states/1").to route_to("job_states#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/job_states/1/edit").to route_to("job_states#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/job_states").to route_to("job_states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/job_states/1").to route_to("job_states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/job_states/1").to route_to("job_states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/job_states/1").to route_to("job_states#destroy", :id => "1")
    end

  end
end
