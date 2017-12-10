FactoryBot.define do
  factory :project do
    name           Faker::Business
    company_id     nil
    nickname       Faker::Name
    project_number Faker::Number
    status         Faker::Number
    client          Faker::Company
    phone           Faker::PhoneNumber
    project_manager Faker::Name
  end
end