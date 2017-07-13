require 'rails_helper'

RSpec.describe "master_materials/new", type: :view do
  before(:each) do
    assign(:master_material, MasterMaterial.new(
      :name => "MyString",
      :description => "MyString",
      :material_type => "MyString",
      :width => 1,
      :length => 1,
      :units => "MyString",
      :unit_cost => "",
      :quantity => 1,
      :quantity_cost => "",
      :status => 1
    ))
  end

  it "renders new master_material form" do
    render

    assert_select "form[action=?][method=?]", master_materials_path, "post" do

      assert_select "input#master_material_name[name=?]", "master_material[name]"

      assert_select "input#master_material_description[name=?]", "master_material[description]"

      assert_select "input#master_material_material_type[name=?]", "master_material[material_type]"

      assert_select "input#master_material_width[name=?]", "master_material[width]"

      assert_select "input#master_material_length[name=?]", "master_material[length]"

      assert_select "input#master_material_units[name=?]", "master_material[units]"

      assert_select "input#master_material_unit_cost[name=?]", "master_material[unit_cost]"

      assert_select "input#master_material_quantity[name=?]", "master_material[quantity]"

      assert_select "input#master_material_quantity_cost[name=?]", "master_material[quantity_cost]"

      assert_select "input#master_material_status[name=?]", "master_material[status]"
    end
  end
end
