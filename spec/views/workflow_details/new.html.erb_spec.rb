require 'rails_helper'

RSpec.describe "workflow_details/new", type: :view do
  before(:each) do
    assign(:workflow_detail, WorkflowDetail.new(
      :company_id => 1,
      :workflow_master_id => "MyString",
      :next => "MyString",
      :previous => "MyString"
    ))
  end

  it "renders new workflow_detail form" do
    render

    assert_select "form[action=?][method=?]", workflow_details_path, "post" do

      assert_select "input#workflow_detail_company_id[name=?]", "workflow_detail[company_id]"

      assert_select "input#workflow_detail_workflow_master_id[name=?]", "workflow_detail[workflow_master_id]"

      assert_select "input#workflow_detail_next[name=?]", "workflow_detail[next]"

      assert_select "input#workflow_detail_previous[name=?]", "workflow_detail[previous]"
    end
  end
end
