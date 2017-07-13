require 'rails_helper'

RSpec.describe "master_materials/index", type: :view do
  before(:each) do
    assign(:master_materials, [
      MasterMaterial.create!(
        :name => "Name",
        :description => "Description",
        :material_type => "Material Type",
        :width => 2,
        :length => 3,
        :units => "Units",
        :unit_cost => "",
        :quantity => 4,
        :quantity_cost => "",
        :status => 5
      ),
      MasterMaterial.create!(
        :name => "Name",
        :description => "Description",
        :material_type => "Material Type",
        :width => 2,
        :length => 3,
        :units => "Units",
        :unit_cost => "",
        :quantity => 4,
        :quantity_cost => "",
        :status => 5
      )
    ])
  end

  it "renders a list of master_materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Material Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Units".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
