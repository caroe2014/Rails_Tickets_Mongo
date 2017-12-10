require 'rails_helper'

RSpec.describe "workflow_masters/index", type: :view do
  before(:each) do
    assign(:workflow_masters, [
      WorkflowMaster.create!(
        :company_id => 2,
        :name => "Name",
        :status => 3
      ),
      WorkflowMaster.create!(
        :company_id => 2,
        :name => "Name",
        :status => 3
      )
    ])
  end

  it "renders a list of workflow_masters" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
