require 'rails_helper'

RSpec.describe "company_groups/index", type: :view do
  before(:each) do
    assign(:company_groups, [
      CompanyGroup.create!(
        :company_id => "Company",
        :user_id => "User",
        :name => "Name",
        :status => 2
      ),
      CompanyGroup.create!(
        :company_id => "Company",
        :user_id => "User",
        :name => "Name",
        :status => 2
      )
    ])
  end

  it "renders a list of company_groups" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
