require "rails_helper"

RSpec.describe MasterGroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/master_groups").to route_to("master_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/master_groups/new").to route_to("master_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/master_groups/1").to route_to("master_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/master_groups/1/edit").to route_to("master_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/master_groups").to route_to("master_groups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/master_groups/1").to route_to("master_groups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/master_groups/1").to route_to("master_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/master_groups/1").to route_to("master_groups#destroy", :id => "1")
    end

  end
end
