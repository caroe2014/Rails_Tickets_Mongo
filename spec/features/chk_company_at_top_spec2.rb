require "capybara/rspec"
require "rails_helper"

describe "Check Company name at the top", js: true, type: :feature do
  it "At Main Menu" do
    visit root_path  
     page.has_content?('Freeman Decorating Inc')
  end
end

