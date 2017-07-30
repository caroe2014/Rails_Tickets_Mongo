require 'rails_helper'

RSpec.describe "local_materials/show", type: :view do
  before(:each) do
    @local_material = assign(:local_material, LocalMaterial.create!(
      :company_id => "",
      :location_id => "",
      :name => "Name",
      :quantity => 2,
      :status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
