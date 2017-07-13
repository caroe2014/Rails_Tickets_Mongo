require 'rails_helper'

RSpec.describe "master_groups/show", type: :view do
  before(:each) do
    @master_group = assign(:master_group, MasterGroup.create!(
      :name => "Name",
      :level => 2,
      :status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
