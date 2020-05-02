require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'has correct informations' do
    let(:jen) { create(:customer) }
    it 'returns a right factory' do
      expect(build(:purchase, customer: jen)).to be_valid
    end
  end

  context 'cannot be valid' do
    let(:shoes) { create(:product) }
    let(:jen) { create(:customer) }

    it 'without a customer' do
      expect(
        build(:purchase)
      ).to_not be_valid
    end

    it 'without a purchase number' do
      expect(
        build(:purchase, customer: jen, purchase_number: nil)
      ).to_not be_valid
    end

    it 'without a price' do
      expect(
        build(:purchase, customer: jen, price: nil)
      ).to_not be_valid
    end

    it 'without a shipping fee' do
      expect(
        build(:purchase, customer: jen, shipping_fee: nil)
      ).to_not be_valid
    end

    it 'without a recipient name' do
      expect(
        build(:purchase, customer: jen, recipient_name: '')
      ).to_not be_valid
    end

    it 'without a recipient contact' do
      expect(
        build(:purchase, customer: jen, recipient_contact: nil)
      ).to_not be_valid
    end

    it 'without a recipient_address' do
      expect(
        build(:purchase, customer: jen, recipient_address: nil)
      ).to_not be_valid
    end

    it 'without a confirmed' do
      expect(
        build(:purchase, customer: jen, confirmed: nil)
      ).to_not be_valid
    end

    it 'without a shipping status' do
      expect(
        build(:purchase, customer: jen, shipping_status: nil)
      ).to_not be_valid
    end

    it 'with no confirmed' do
      expect(
        build(:purchase, customer: jen, confirmed: false)
      ).to_not be_valid
    end
  end
end
