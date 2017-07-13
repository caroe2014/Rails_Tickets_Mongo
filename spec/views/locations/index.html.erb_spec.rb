require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :company => nil,
        :name => "Name",
        :shortname => "Shortname",
        :address1 => "Address1",
        :address2 => "Address2"
      ),
      Location.create!(
        :company => nil,
        :name => "Name",
        :shortname => "Shortname",
        :address1 => "Address1",
        :address2 => "Address2"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Shortname".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
  end
end
