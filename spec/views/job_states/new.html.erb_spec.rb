require 'rails_helper'

RSpec.describe "job_states/new", type: :view do
  before(:each) do
    assign(:job_state, JobState.new(
      :step_number => "MyString",
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders new job_state form" do
    render

    assert_select "form[action=?][method=?]", job_states_path, "post" do

      assert_select "input#job_state_step_number[name=?]", "job_state[step_number]"

      assert_select "input#job_state_name[name=?]", "job_state[name]"

      assert_select "input#job_state_status[name=?]", "job_state[status]"
    end
  end
end
