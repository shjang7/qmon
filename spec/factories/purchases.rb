FactoryBot.define do
  factory :purchase do
    purchase_number { Faker::Number.number(digits: 2) }
    price { Faker::Number.number(digits: 2) }
    shipping_fee { 0 }
    recipient_name { Faker::Alphanumeric.alphanumeric(number: 2) }
    recipient_contact { Faker::PhoneNumber.cell_phone }
    recipient_address { Faker::Address.full_address }
    shipping_status { 1 }
    confirmed { true }
    customer
  end
end
