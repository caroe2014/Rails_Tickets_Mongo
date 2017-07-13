require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:all)do
    @company = Company.find(1)
    @project = Project.new(company_id:@company.id, name:"Endocrinology 2017", nickname:"endo2017", number:1000, 
    client: 1000, phone: "555-666-7777" , estimate: 1000000, 
    approved_budget: 1500000, accumulated_cost: 1750000)
  end

  it " la Compania deberia existir en test" do
    expect(@company.name).to eq("Freeman Decorating LLC")
  end


  it " la Compania deberia tener un proyecto" do
    expect(@project.nickname).to eq("endo2017")
  end
end
