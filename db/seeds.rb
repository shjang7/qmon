require 'faker'

Merchandiser.destroy_all
Customer.destroy_all
Category.destroy_all

categories = []
['best', 'health', 'spring', 'fashion', 'travel', 'beauty', 'food'].each do |c|
  categories.push Category.create!(name: c)
end

merchandiser_username = 'darkjoke'
customer_username = 'sharpsteam'
common_password = 'foobar'

m1 = Merchandiser.create(
  username: merchandiser_username,
  password: common_password,
  password_confirmation: common_password,
  email: Faker::Internet.email,
  business_name: Faker::Company.unique.name,
  owner_name: Faker::Name.name,
  contact_number: Faker::PhoneNumber.cell_phone,
  business_number: Faker::Company.swedish_organisation_number,
  company_address: Faker::Address.full_address
)

categories.each do |c|
  p = m1.products.build(
    title: Faker::Company.bs,
    price: Faker::Number.number(digits: 5),
    shipping_fee: 0,
    category_id: c.id
  )
  p.save(validate: false)
end

Customer.create(
  username: customer_username,
  name: Faker::Name.name,
  contact_number: Faker::PhoneNumber.cell_phone,
  address: Faker::Address.full_address,
  password: 'foobar',
  password_confirmation: 'foobar'
)
