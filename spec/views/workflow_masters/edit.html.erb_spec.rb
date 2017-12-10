require 'rails_helper'

RSpec.describe "workflow_masters/edit", type: :view do
  before(:each) do
    @workflow_master = assign(:workflow_master, WorkflowMaster.create!(
      :company_id => 1,
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders the edit workflow_master form" do
    render

    assert_select "form[action=?][method=?]", workflow_master_path(@workflow_master), "post" do

      assert_select "input#workflow_master_company_id[name=?]", "workflow_master[company_id]"

      assert_select "input#workflow_master_name[name=?]", "workflow_master[name]"

      assert_select "input#workflow_master_status[name=?]", "workflow_master[status]"
    end
  end
end
