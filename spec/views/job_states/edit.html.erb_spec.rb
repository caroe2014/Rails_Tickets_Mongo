require 'rails_helper'

RSpec.describe "job_states/edit", type: :view do
  before(:each) do
    @job_state = assign(:job_state, JobState.create!(
      :step_number => "MyString",
      :name => "MyString",
      :status => 1
    ))
  end

  it "renders the edit job_state form" do
    render

    assert_select "form[action=?][method=?]", job_state_path(@job_state), "post" do

      assert_select "input#job_state_step_number[name=?]", "job_state[step_number]"

      assert_select "input#job_state_name[name=?]", "job_state[name]"

      assert_select "input#job_state_status[name=?]", "job_state[status]"
    end
  end
end
