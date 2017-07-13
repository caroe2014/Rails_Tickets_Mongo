require 'rails_helper'

RSpec.describe "company_groups/edit", type: :view do
  before(:each) do
    @company_group = assign(:company_group, CompanyGroup.create!(
      :company_id => "MyString",
      :user_id => "MyString",
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders the edit company_group form" do
    render

    assert_select "form[action=?][method=?]", company_group_path(@company_group), "post" do

      assert_select "input#company_group_company_id[name=?]", "company_group[company_id]"

      assert_select "input#company_group_user_id[name=?]", "company_group[user_id]"

      assert_select "input#company_group_name[name=?]", "company_group[name]"

      assert_select "input#company_group_status[name=?]", "company_group[status]"
    end
  end
end
