require 'faker'

Category.delete_all

['best', 'health', 'spring', 'fashion', 'travel', 'beauty', 'food'].each do |c|
  Category.create!(name: c)
end

merchandiser_username = 'darkjoke'
common_password = 'foobar'
Merchandiser.delete_all

Merchandiser.create!(
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
