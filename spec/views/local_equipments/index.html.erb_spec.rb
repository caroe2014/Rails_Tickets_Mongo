require 'rails_helper'

RSpec.describe "local_equipments/index", type: :view do
  before(:each) do
    assign(:local_equipments, [
      LocalEquipment.create!(
        :name => "Name",
        :equipment_type => "Equipment Type",
        :status => "Status",
        :location_id => ""
      ),
      LocalEquipment.create!(
        :name => "Name",
        :equipment_type => "Equipment Type",
        :status => "Status",
        :location_id => ""
      )
    ])
  end

  it "renders a list of local_equipments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Equipment Type".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
