require 'rails_helper'

RSpec.describe "local_equipments/show", type: :view do
  before(:each) do
    @local_equipment = assign(:local_equipment, LocalEquipment.create!(
      :name => "Name",
      :equipment_type => "Equipment Type",
      :status => "Status",
      :location_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Equipment Type/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
