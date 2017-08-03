require "rails_helper"

RSpec.feature "Check Company name at the top" do
  scenario "At Main Menu" do
    visit root_path  
     page.has_content?('Freeman Decorating Inc')
  end
end

RSpec.feature "Check User name at the top" do
  scenario "At Main Menu" do
    visit root_path  
     page.has_content?('Hi, edwin.caro@freemanco.com')
  end
end

RSpec.feature "Check Menu at the top" do
  scenario "At Main Menu" do
    visit root_path  
     page.has_content?('Projects')
  end
end

RSpec.feature "Check submenu at the top" do
  scenario "At Main Menu" do
    visit root_path
    click_on("Projects")  
     page.has_content?('List Projects')
  end
end


RSpec.feature "Check Company name on projects menu " do
  scenario "At Projects" do
    visit root_path
    click_on("Projects")
    click_on("List Projects") 
     !page.has_content?('Freeman Decorating Inc')
  end
end

