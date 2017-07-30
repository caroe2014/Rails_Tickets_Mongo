module ApplicationHelper
  
  def generate_random
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
    result = string = (0...50).map { o[rand(o.length)] }.join
    result
  end

  def set_company_from_session(company_id)
      @company = []
      @company << Company.find(company_id)
      @company    
  end
   
  def set_one_location_from_company(pcompany)
    local = Location.where( :company_id => pcompany )
    local
  end
  
end
