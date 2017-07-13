require 'rails_helper'

RSpec.describe "master_groups/new", type: :view do
  before(:each) do
    assign(:master_group, MasterGroup.new(
      :name => "MyString",
      :level => 1,
      :status => 1
    ))
  end

  it "renders new master_group form" do
    render

    assert_select "form[action=?][method=?]", master_groups_path, "post" do

      assert_select "input#master_group_name[name=?]", "master_group[name]"

      assert_select "input#master_group_level[name=?]", "master_group[level]"

      assert_select "input#master_group_status[name=?]", "master_group[status]"
    end
  end
end
