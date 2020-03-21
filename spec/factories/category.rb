FactoryBot.define do
  factory :category do
    name { |n| "testCategory#{n}" }
  end
end
