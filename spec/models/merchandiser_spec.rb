require 'rails_helper'

RSpec.describe Merchandiser, type: :model do
  context 'has correct informations' do
    it 'with valid attributes' do
      password = Faker::Alphanumeric.alpha(number: 6)
      jen = Merchandiser.new(
        username: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password,
        business_name: Faker::Name.unique.name,
        owner_name: Faker::Name.name,
        contact_number: Faker::PhoneNumber.cell_phone,
        business_number: Faker::Company.unique.swedish_organisation_number,
        company_address: Faker::Address.full_address
      )
      expect(jen).to be_valid
    end

    it 'with a right factory' do
      expect(build(:merchandiser)).to be_valid
    end
  end

  context 'cannot be valid' do
    it 'without a username' do
      m = build(:merchandiser, username: '')
      expect(m).to_not be_valid
    end

    it 'without a email' do
      m = build(:merchandiser, email: '')
      expect(m).to_not be_valid
    end

    it 'without a business_name' do
      m = build(:merchandiser, business_name: '')
      expect(m).to_not be_valid
    end

    it 'without a owner_name' do
      m = build(:merchandiser, owner_name: '')
      expect(m).to_not be_valid
    end

    it 'without a business_number' do
      m = build(:merchandiser, business_number: '')
      expect(m).to_not be_valid
    end

    it 'without a contact_number' do
      m = build(:merchandiser, contact_number: '')
      expect(m).to_not be_valid
    end

    it 'without a company_address' do
      m = build(:merchandiser, company_address: '')
      expect(m).to_not be_valid
    end

    it 'without a password' do
      m = build(:merchandiser, password: '')
      expect(m).to_not be_valid
    end
    
    it 'with duplicated username' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, username: mos.username)
      expect(jen).to_not be_valid
    end

    it 'with duplicated email' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, email: mos.email)
      expect(jen).to_not be_valid
    end

    it 'with duplicated business_name' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, business_name: mos.business_name)
      expect(jen).to_not be_valid
    end

    it 'with duplicated business_number' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, business_number: mos.business_number)
      expect(jen).to_not be_valid
    end

    it 'with a short username under 4 characters' do
      jen = build(:merchandiser, username: Faker::Alphanumeric.alphanumeric(number: 3))
      expect(jen).to_not be_valid
    end

    it 'with a long username over 50 characters' do
      jen = build(:merchandiser, username: Faker::Alphanumeric.alphanumeric(number: 51))
      expect(jen).to_not be_valid
    end
  end
end
