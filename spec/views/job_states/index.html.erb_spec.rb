require 'rails_helper'

RSpec.describe "job_states/index", type: :view do
  before(:each) do
    assign(:job_states, [
      JobState.create!(
        :step_number => "Step Number",
        :name => "Name",
        :status => 2
      ),
      JobState.create!(
        :step_number => "Step Number",
        :name => "Name",
        :status => 2
      )
    ])
  end

  it "renders a list of job_states" do
    render
    assert_select "tr>td", :text => "Step Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
