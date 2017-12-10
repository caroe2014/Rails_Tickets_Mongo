require 'rails_helper'

RSpec.describe "workflow_masters/new", type: :view do
  before(:each) do
    assign(:workflow_master, WorkflowMaster.new(
      :company_id => 1,
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders new workflow_master form" do
    render

    assert_select "form[action=?][method=?]", workflow_masters_path, "post" do

      assert_select "input#workflow_master_company_id[name=?]", "workflow_master[company_id]"

      assert_select "input#workflow_master_name[name=?]", "workflow_master[name]"

      assert_select "input#workflow_master_status[name=?]", "workflow_master[status]"
    end
  end
end
