require "rails_helper"

RSpec.describe LocalMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/local_materials").to route_to("local_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/local_materials/new").to route_to("local_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/local_materials/1").to route_to("local_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/local_materials/1/edit").to route_to("local_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/local_materials").to route_to("local_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/local_materials/1").to route_to("local_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/local_materials/1").to route_to("local_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/local_materials/1").to route_to("local_materials#destroy", :id => "1")
    end

  end
end
