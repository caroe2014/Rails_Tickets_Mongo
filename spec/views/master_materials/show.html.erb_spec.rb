require 'rails_helper'

RSpec.describe "master_materials/show", type: :view do
  before(:each) do
    @master_material = assign(:master_material, MasterMaterial.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Material Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Units/)
    expect(rendered).to match(//)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
    expect(rendered).to match(/5/)
  end
end
