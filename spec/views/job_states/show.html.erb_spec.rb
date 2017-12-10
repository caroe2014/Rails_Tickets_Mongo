require 'rails_helper'

RSpec.describe "job_states/show", type: :view do
  before(:each) do
    @job_state = assign(:job_state, JobState.create!(
      :step_number => "Step Number",
      :name => "Name",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Step Number/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
