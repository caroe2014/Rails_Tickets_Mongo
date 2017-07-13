require 'rails_helper'

RSpec.describe "company_groups/show", type: :view do
  before(:each) do
    @company_group = assign(:company_group, CompanyGroup.create!(
      :company_id => "Company",
      :user_id => "User",
      :name => "Name",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
