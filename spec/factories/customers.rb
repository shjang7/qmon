FactoryBot.define do
  factory :customer do
    sequence(:username) { |n| "testerCustomer#{n}" }
    password { Faker::Alphanumeric.alphanumeric(number: 6) }
    contact_number { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
  end
end
