FactoryBot.define do
  factory :product_item do
    title { Faker::Alphanumeric.alphanumeric(number: 2) }
    price { Faker::Number.number(digits: 2) }
    total_amount { Faker::Number.number(digits: 2) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/default.png'), 'image/jpeg') }
    product
  end
end
