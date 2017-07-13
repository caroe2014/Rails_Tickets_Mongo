require "rails_helper"

RSpec.describe MasterMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/master_materials").to route_to("master_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/master_materials/new").to route_to("master_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/master_materials/1").to route_to("master_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/master_materials/1/edit").to route_to("master_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/master_materials").to route_to("master_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/master_materials/1").to route_to("master_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/master_materials/1").to route_to("master_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/master_materials/1").to route_to("master_materials#destroy", :id => "1")
    end

  end
end
