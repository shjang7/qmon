FactoryBot.define do
  factory :order do
    title { Faker::Alphanumeric.alphanumeric(number: 2) }
    quantity { Faker::Number.number(digits: 2) }
    price { Faker::Number.number(digits: 2) }
    purchase
  end
end
