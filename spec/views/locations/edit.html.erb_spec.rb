require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :company => nil,
      :name => "MyString",
      :shortname => "MyString",
      :address1 => "MyString",
      :address2 => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_company_id[name=?]", "location[company_id]"

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_shortname[name=?]", "location[shortname]"

      assert_select "input#location_address1[name=?]", "location[address1]"

      assert_select "input#location_address2[name=?]", "location[address2]"
    end
  end
end
