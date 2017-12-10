require 'rails_helper'

RSpec.describe Project, type: :model do
   before(:all) do
      DatabaseCleaner.start

      def create_ticket (name, subname, description, width, height, qty, single, double)              
            name ||= "WT" + "#{Faker::Number}" 
            subname ||= "LI" + "#{Faker::Number}"
            description ||=  "#{Faker::Name}"
            width ||= rand(40..1022).to_s
            height ||= rand(48..280).to_s
            qty ||= rand(1..23).to_s
            valor = rand(0..1)
            single = false
            if (valor == 1)
              single = true
            end  
            double = !single
            project_id = @project._id
            
            PrintingTicket.create!(
              name: name,
              subname: subname,
              description: description,
              width: width,
              height: height,
              qty: qty,
              single: single,
              double: double,
              project_id: project_id)
      end

      @company = Company.create!(name: "Testing Company LLC",
                                 nickname: "TCLLC",
                                 city: "Testing City",
                                 state: "Testing State",
                                 country: "Testing Country")
  
       @project = Project.create!(name: "Project testing 2017",
                      company_id: @company._id,
                      nickname: "PT17",
                      project_number: 12345,
                      status: 1,
                      client: "Testing Company Inc",
                      phone: "555-666-9999",
                      project_manager: "testing Person")
                      
        @ticket = create_ticket("WT2017")
   end

   after(:all) do
       DatabaseCleaner.clean
   end
    
    it "Debe existing una compania" do
      expect(@company.name).to eq("Testing Company LLC")
    end
    it " Debe existe un project " do
      expect(@project.nickname).to eq("PT17")
    end
    it "Debe existir in ticket" do
      expect(@ticket.name).to eq("WT2017")
    end
  
end
