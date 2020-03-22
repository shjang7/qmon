FactoryBot.define do
  factory :review do
    body { Faker::Alphanumeric.alphanumeric(number: 2) }
    rating { 5 }
    product
    customer
  end
end
