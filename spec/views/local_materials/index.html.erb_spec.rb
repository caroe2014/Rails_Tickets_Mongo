require 'rails_helper'

RSpec.describe "local_materials/index", type: :view do
  before(:each) do
    assign(:local_materials, [
      LocalMaterial.create!(
        :company_id => "",
        :location_id => "",
        :name => "Name",
        :quantity => 2,
        :status => 3
      ),
      LocalMaterial.create!(
        :company_id => "",
        :location_id => "",
        :name => "Name",
        :quantity => 2,
        :status => 3
      )
    ])
  end

  it "renders a list of local_materials" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
