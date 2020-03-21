FactoryBot.define do
  factory :purchase do
    purchase_number { Faker::Number.number(digits: 4) }
    price { Faker::Number.number(digits: 3) }
    shipping_fee { 0 }
    recipient_name { Faker::Alphanumeric.alphanumeric(number: 6) }
    recipient_contact { Faker::PhoneNumber.cell_phone }
    recipient_address { Faker::Address.full_address }
    shipping_status { 1 }
    arrive_date { "" }
    confirmed { true }
    customer
  end
end
