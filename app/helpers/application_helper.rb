module ApplicationHelper
  
  def generate_random
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
    result = string = (0...50).map { o[rand(o.length)] }.join
    result
  end
  
end
