require 'rails_helper'

RSpec.describe "master_groups/index", type: :view do
  before(:each) do
    assign(:master_groups, [
      MasterGroup.create!(
        :name => "Name",
        :level => 2,
        :status => 3
      ),
      MasterGroup.create!(
        :name => "Name",
        :level => 2,
        :status => 3
      )
    ])
  end

  it "renders a list of master_groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
