FactoryBot.define do
  factory :product_item do
    title { Faker::Alphanumeric.alphanumeric(number: 6) }
    price { Faker::Number.number(digits: 4) }
    total_amount { Faker::Number.number(digits: 3) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/default.png'), 'image/jpeg') }
    product
  end
end
