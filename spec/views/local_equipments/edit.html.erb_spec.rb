require 'rails_helper'

RSpec.describe "local_equipments/edit", type: :view do
  before(:each) do
    @local_equipment = assign(:local_equipment, LocalEquipment.create!(
      :name => "MyString",
      :equipment_type => "MyString",
      :status => "MyString",
      :location_id => ""
    ))
  end

  it "renders the edit local_equipment form" do
    render

    assert_select "form[action=?][method=?]", local_equipment_path(@local_equipment), "post" do

      assert_select "input#local_equipment_name[name=?]", "local_equipment[name]"

      assert_select "input#local_equipment_equipment_type[name=?]", "local_equipment[equipment_type]"

      assert_select "input#local_equipment_status[name=?]", "local_equipment[status]"

      assert_select "input#local_equipment_location_id[name=?]", "local_equipment[location_id]"
    end
  end
end
