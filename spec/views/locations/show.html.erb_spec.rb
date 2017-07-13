require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :company => nil,
      :name => "Name",
      :shortname => "Shortname",
      :address1 => "Address1",
      :address2 => "Address2"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Shortname/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
  end
end
