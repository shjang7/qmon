FactoryBot.define do
  factory :merchandiser do
    sequence(:username) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@example.org" }
    password { Faker::Alphanumeric.alphanumeric(number: 6) }
    sequence(:business_name) { |n| "tester_company#{n}" }
    owner_name { Faker::Name.name }
    contact_number { Faker::PhoneNumber.cell_phone }
    sequence(:business_number) { |n| "#{Faker::Company.swedish_organisation_number}#{n}" }
    company_address { Faker::Address.full_address }
  end
end
