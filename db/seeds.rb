# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.each do |cia|
  locations = Location.where( { :company_id => @company._id }
  locations.each do |loc|
    PrintingTicket.create!(
    10.times do |i|
       s_ds = rand(0..1)
       valor = false
       if (s_ds == 1)
         valor = true
       end  
       
       name: "WT" + #{Faker::Number},
       subname: "LI" +#{Faker::Number} + i.to_s,
       description: "P T/B"
       width: rand(40..1022).to_s
       height: rand(48..280).to_s
       qty: rand(1..22).to_s
       single: valor
       double: !valor
       
    end
    )
    
  end  
end


