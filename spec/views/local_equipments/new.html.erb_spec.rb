require 'rails_helper'

RSpec.describe "local_equipments/new", type: :view do
  before(:each) do
    assign(:local_equipment, LocalEquipment.new(
      :name => "MyString",
      :equipment_type => "MyString",
      :status => "MyString",
      :location_id => ""
    ))
  end

  it "renders new local_equipment form" do
    render

    assert_select "form[action=?][method=?]", local_equipments_path, "post" do

      assert_select "input#local_equipment_name[name=?]", "local_equipment[name]"

      assert_select "input#local_equipment_equipment_type[name=?]", "local_equipment[equipment_type]"

      assert_select "input#local_equipment_status[name=?]", "local_equipment[status]"

      assert_select "input#local_equipment_location_id[name=?]", "local_equipment[location_id]"
    end
  end
end
