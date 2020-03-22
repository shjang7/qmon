require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'has correct informations' do
    it 'with valid attributes' do
      password = Faker::Alphanumeric.alpha(number: 6)
      jen = Customer.new(
        username: Faker::Name.unique.name,
        password: password,
        password_confirmation: password,
        contact_number: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.full_address
      )
    end

    it 'with a right factory' do
      expect(build(:customer)).to be_valid
    end
  end

  context 'cannot be valid' do
    it 'without a username' do
      m = build(:customer, username: '')
      expect(m).to_not be_valid
    end

    it 'without a contact_number' do
      m = build(:customer, contact_number: '')
      expect(m).to_not be_valid
    end

    it 'without a address' do
      m = build(:customer, address: '')
      expect(m).to_not be_valid
    end

    it 'without a password' do
      m = build(:customer, password: '')
      expect(m).to_not be_valid
    end
    
    it 'with duplicated username' do
      mos = create(:customer)
      jen = build(:customer, username: mos.username)
      expect(jen).to_not be_valid
    end

    it 'with a short username under 4 characters' do
      jen = build(:customer, username: Faker::Alphanumeric.alphanumeric(number: 3))
      expect(jen).to_not be_valid
    end

    it 'with a long username over 50 characters' do
      jen = build(:customer, username: Faker::Alphanumeric.alphanumeric(number: 51))
      expect(jen).to_not be_valid
    end
  end
end
