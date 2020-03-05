require 'rails_helper'

RSpec.describe Merchandiser, type: :model do
  context 'with valid attributes' do
    it 'has correct informations' do
      jen = Merchandiser.new(
        username: 'sample-user-0',
        email: 'sample-user-0@example.org',
        password: 'foobar',
        password_confirmation: 'foobar',
        business_name: 'sample-company-0',
        owner_name: 'sample owner',
        contact_number: '(02)01234' ,
        business_number: '5678',
        company_address: 'sample address'
      )
      expect(jen).to be_valid
    end

    it 'has a right factory' do
      expect(build(:merchandiser)).to be_valid
    end
  end

  context 'with invalid attributes for blank' do
    it 'cannot have a blank username' do
      m = build(:merchandiser, username: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank business_name' do
      m = build(:merchandiser, business_name: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank owner_name' do
      m = build(:merchandiser, owner_name: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank business_number' do
      m = build(:merchandiser, business_number: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank contact_number' do
      m = build(:merchandiser, contact_number: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank company_address' do
      m = build(:merchandiser, company_address: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank email' do
      m = build(:merchandiser, email: '')
      expect(m).to_not be_valid
    end

    it 'cannot have a blank password' do
      m = build(:merchandiser, password: '')
      expect(m).to_not be_valid
    end
  end

  context 'with invalid attributes for wrong info' do
    it 'cannot be valid with duplicate username' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, username: mos.username)
      expect(jen).to_not be_valid
    end

    it 'cannot be valid with duplicate email' do
      mos = create(:merchandiser)
      jen = build(:merchandiser, email: mos.email)
      expect(jen).to_not be_valid
    end

    it 'cannot be valid with a short username under 4 characters' do
      jen = build(:merchandiser, username: Faker::Alphanumeric.alphanumeric(number: 3))
      expect(jen).to_not be_valid
    end

    it 'cannot be valid with a long username over 50 characters' do
      jen = build(:merchandiser, username: Faker::Alphanumeric.alphanumeric(number: 51))
      expect(jen).to_not be_valid
    end
  end
end
