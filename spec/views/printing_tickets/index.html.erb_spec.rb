require 'rails_helper'

RSpec.describe "printing_tickets/index", type: :view do
  before(:each) do
    assign(:printing_tickets, [
      PrintingTicket.create!(
        :name => "Name",
        :description => "Description",
        :width => "Width",
        :height => "Height",
        :qty => "Qty",
        :single => "Single",
        :double => "Double",
        :material => "",
        :location_id => "Location",
        :printer_id => "Printer"
      ),
      PrintingTicket.create!(
        :name => "Name",
        :description => "Description",
        :width => "Width",
        :height => "Height",
        :qty => "Qty",
        :single => "Single",
        :double => "Double",
        :material => "",
        :location_id => "Location",
        :printer_id => "Printer"
      )
    ])
  end

  it "renders a list of printing_tickets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Width".to_s, :count => 2
    assert_select "tr>td", :text => "Height".to_s, :count => 2
    assert_select "tr>td", :text => "Qty".to_s, :count => 2
    assert_select "tr>td", :text => "Single".to_s, :count => 2
    assert_select "tr>td", :text => "Double".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Printer".to_s, :count => 2
  end
end
