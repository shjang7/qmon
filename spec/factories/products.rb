FactoryBot.define do
  factory :product do
    title { Faker::Alphanumeric.alphanumeric(number: 2) }
    price { Faker::Number.number(digits: 2) }
    shipping_fee { Faker::Number.number(digits: 2) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/default.png'), 'image/jpeg') }
    category
    merchandiser
  end
end
