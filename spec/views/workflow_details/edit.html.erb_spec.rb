require 'rails_helper'

RSpec.describe "workflow_details/edit", type: :view do
  before(:each) do
    @workflow_detail = assign(:workflow_detail, WorkflowDetail.create!(
      :company_id => 1,
      :workflow_master_id => "MyString",
      :next => "MyString",
      :previous => "MyString"
    ))
  end

  it "renders the edit workflow_detail form" do
    render

    assert_select "form[action=?][method=?]", workflow_detail_path(@workflow_detail), "post" do

      assert_select "input#workflow_detail_company_id[name=?]", "workflow_detail[company_id]"

      assert_select "input#workflow_detail_workflow_master_id[name=?]", "workflow_detail[workflow_master_id]"

      assert_select "input#workflow_detail_next[name=?]", "workflow_detail[next]"

      assert_select "input#workflow_detail_previous[name=?]", "workflow_detail[previous]"
    end
  end
end
