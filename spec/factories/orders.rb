FactoryBot.define do
  factory :order do
    title { Faker::Alphanumeric.alphanumeric(number: 6) }
    quantity { Faker::Number.number(digits: 3) }
    price { Faker::Number.number(digits: 5) }
    purchase
  end
end
