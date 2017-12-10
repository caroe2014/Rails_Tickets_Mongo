require 'rails_helper'

RSpec.describe "workflow_details/index", type: :view do
  before(:each) do
    assign(:workflow_details, [
      WorkflowDetail.create!(
        :company_id => 2,
        :workflow_master_id => "Workflow Master",
        :next => "Next",
        :previous => "Previous"
      ),
      WorkflowDetail.create!(
        :company_id => 2,
        :workflow_master_id => "Workflow Master",
        :next => "Next",
        :previous => "Previous"
      )
    ])
  end

  it "renders a list of workflow_details" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Workflow Master".to_s, :count => 2
    assert_select "tr>td", :text => "Next".to_s, :count => 2
    assert_select "tr>td", :text => "Previous".to_s, :count => 2
  end
end
