# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.each do |cia|
  Project.where(company_id: cia._id).each do |project|
    js = JobState.first()
    js_s = js._id.to_s
    Location.where(company_id: cia._id ).each do |loc|
    lm = LocalMaterial.where(location_id: loc._id).first
    le = LocalEquipment.where(location_id: loc._id).first
       
    JobState.each do |js|
      2.times do |i|     
        js_s = js._id.to_s
        fn = Faker::Number.number    
        PrintingTicket.create!(name: "WT" + fn.to_s,
                               subname: "LI" + fn.to_s + i.to_s,
                               description: "P T/B",
                               width: rand(40..360).to_s,
                               height: rand(48..150).to_s,
                               qty: rand(1..20).to_s,
                               single: true,
                               double: false,
                               material_id: lm._id.to_s,
                               equipment_id: le._id.to_s,
                               location_id: loc._id,
                               project_id: project._id,
                               job_state_id: js_s
                               )
                          
        end
      end  
    end
  end    
end


