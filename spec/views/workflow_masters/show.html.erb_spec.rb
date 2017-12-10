require 'rails_helper'

RSpec.describe "workflow_masters/show", type: :view do
  before(:each) do
    @workflow_master = assign(:workflow_master, WorkflowMaster.create!(
      :company_id => 2,
      :name => "Name",
      :status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
  end
end
