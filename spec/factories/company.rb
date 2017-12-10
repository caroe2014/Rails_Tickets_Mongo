FactoryBot.define do
  factory :company do
    name     Faker::Company
    phone    Faker::PhoneNumber
    contact  Faker::Name
    address1 Faker::Address
    city     Faker::Address.city
    state    Faker::Address.state
    country  Faker::Address.country
  end
end