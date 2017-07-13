require 'rails_helper'

RSpec.describe "company_groups/new", type: :view do
  before(:each) do
    assign(:company_group, CompanyGroup.new(
      :company_id => "MyString",
      :user_id => "MyString",
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders new company_group form" do
    render

    assert_select "form[action=?][method=?]", company_groups_path, "post" do

      assert_select "input#company_group_company_id[name=?]", "company_group[company_id]"

      assert_select "input#company_group_user_id[name=?]", "company_group[user_id]"

      assert_select "input#company_group_name[name=?]", "company_group[name]"

      assert_select "input#company_group_status[name=?]", "company_group[status]"
    end
  end
end
