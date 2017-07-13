json.array!(@companies) do |company|
  json.extract! company, :id, :name, :phone, :webpage, :contact, :address1, :address2, :city, :state, :country
  json.url company_url(company, format: :json)
end
