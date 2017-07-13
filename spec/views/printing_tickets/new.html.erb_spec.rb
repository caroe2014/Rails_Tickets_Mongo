require 'rails_helper'

RSpec.describe "printing_tickets/new", type: :view do
  before(:each) do
    assign(:printing_ticket, PrintingTicket.new(
      :name => "MyString",
      :description => "MyString",
      :width => "MyString",
      :height => "MyString",
      :qty => "MyString",
      :single => "MyString",
      :double => "MyString",
      :material => "",
      :location_id => "MyString",
      :printer_id => "MyString"
    ))
  end

  it "renders new printing_ticket form" do
    render

    assert_select "form[action=?][method=?]", printing_tickets_path, "post" do

      assert_select "input#printing_ticket_name[name=?]", "printing_ticket[name]"

      assert_select "input#printing_ticket_description[name=?]", "printing_ticket[description]"

      assert_select "input#printing_ticket_width[name=?]", "printing_ticket[width]"

      assert_select "input#printing_ticket_height[name=?]", "printing_ticket[height]"

      assert_select "input#printing_ticket_qty[name=?]", "printing_ticket[qty]"

      assert_select "input#printing_ticket_single[name=?]", "printing_ticket[single]"

      assert_select "input#printing_ticket_double[name=?]", "printing_ticket[double]"

      assert_select "input#printing_ticket_material[name=?]", "printing_ticket[material]"

      assert_select "input#printing_ticket_location_id[name=?]", "printing_ticket[location_id]"

      assert_select "input#printing_ticket_printer_id[name=?]", "printing_ticket[printer_id]"
    end
  end
end
