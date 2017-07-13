require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all)do

    @company = Company.find(1)
    @project = Project.new(company_id:@company.id, name:"Endocrinology 2017", nickname:"endo2017", number:1000, 
    client: 1000, phone: "555-666-7777" , estimate: 1000000, approved_budget: 1500000, accumulated_cost: 1750000)
    @task = Task.new(company_id:@company_id, project_id:@project.id, name:"Proposal", next_task:1, previous_task:0, parent_task:0,
    child_task:0, assigned_group:10, assigned_person:109, location:10, quantity:1, measure_unit:2, status:1)
  end

  it "la Compania deberia existir en test" do
    expect(@company.name).to eq("Freeman Decorating LLC")
  end


  it "la Compania deberia tener un proyecto" do
    expect(@project.nickname).to eq("endo2017")
  end
  
  it "El proyecto deberia tener una tarea" do
    expect(@task.project_id).to eq(@project.id)
  end
  
end
