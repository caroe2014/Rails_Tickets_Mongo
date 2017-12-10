require 'rails_helper'

RSpec.describe "workflow_details/show", type: :view do
  before(:each) do
    @workflow_detail = assign(:workflow_detail, WorkflowDetail.create!(
      :company_id => 2,
      :workflow_master_id => "Workflow Master",
      :next => "Next",
      :previous => "Previous"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Workflow Master/)
    expect(rendered).to match(/Next/)
    expect(rendered).to match(/Previous/)
  end
end
