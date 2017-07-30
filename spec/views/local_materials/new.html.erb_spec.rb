require 'rails_helper'

RSpec.describe "local_materials/new", type: :view do
  before(:each) do
    assign(:local_material, LocalMaterial.new(
      :company_id => "",
      :location_id => "",
      :name => "MyString",
      :quantity => 1,
      :status => 1
    ))
  end

  it "renders new local_material form" do
    render

    assert_select "form[action=?][method=?]", local_materials_path, "post" do

      assert_select "input#local_material_company_id[name=?]", "local_material[company_id]"

      assert_select "input#local_material_location_id[name=?]", "local_material[location_id]"

      assert_select "input#local_material_name[name=?]", "local_material[name]"

      assert_select "input#local_material_quantity[name=?]", "local_material[quantity]"

      assert_select "input#local_material_status[name=?]", "local_material[status]"
    end
  end
end
