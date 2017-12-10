require "spec_helper"


describe "Check Company name at the top - local_equipments", :type => :feature do 
  it "Case Sign In" do
    visit "/users/sign_up"
    within '#new_user' do  
      fill_in "Email",    with: "edwin.caro@freemanco.com"
      fill_in "Password", with: "1dv1vvdu" 
    end  
    click_button 'Log in'
     
    expect(page).to have_content 'Company Testing LLC'
    expect(page).to have_content 'Hi, edwin.caro@freemanco.com'
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Search'  
  end

  it "At index local_equipments" do
    visit  projects_path  
    expect(page).to have_content('Company Testing LLC')
    expect(page).to have_content('Hi, edwin.caro@freemanco.com')
    expect(page).to have_content('Logout')
    expect(page).to have_content('Search')      
  end
  
  it "Index Content" do
     expect(page).to have_content('Listing Projects')
  end

end



