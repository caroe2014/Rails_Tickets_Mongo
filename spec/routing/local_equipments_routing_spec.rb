require "rails_helper"

RSpec.describe LocalEquipmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/local_equipments").to route_to("local_equipments#index")
    end

    it "routes to #new" do
      expect(:get => "/local_equipments/new").to route_to("local_equipments#new")
    end

    it "routes to #show" do
      expect(:get => "/local_equipments/1").to route_to("local_equipments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/local_equipments/1/edit").to route_to("local_equipments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/local_equipments").to route_to("local_equipments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/local_equipments/1").to route_to("local_equipments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/local_equipments/1").to route_to("local_equipments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/local_equipments/1").to route_to("local_equipments#destroy", :id => "1")
    end

  end
end
