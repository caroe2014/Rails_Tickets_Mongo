require 'rails_helper'

RSpec.describe "printing_tickets/show", type: :view do
  before(:each) do
    @printing_ticket = assign(:printing_ticket, PrintingTicket.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Width/)
    expect(rendered).to match(/Height/)
    expect(rendered).to match(/Qty/)
    expect(rendered).to match(/Single/)
    expect(rendered).to match(/Double/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Printer/)
  end
end
