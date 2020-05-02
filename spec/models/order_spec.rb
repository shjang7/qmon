require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'has correct informations' do
    let(:buy) { create(:purchase) }
    let(:shoes) { create(:product_item) }

    it 'with a right factory' do
      expect(build(:order, purchase: buy, product_item: shoes)).to be_valid
    end
  end

  context 'cannot be valid' do
    let(:buy) { create(:purchase) }
    let(:shoes) { create(:product_item) }

    it 'without a product item' do
      expect(
        build(:order, product_item: nil)
      ).to_not be_valid
    end

    it 'without a purchase' do
      expect(
        build(:order, purchase: nil)
      ).to_not be_valid
    end

    it 'without a title' do
      expect(
        build(:order, purchase: buy, product_item: shoes, title: nil)
      ).to_not be_valid
    end

    it 'without a quantity' do
      expect(
        build(:order, purchase: buy, product_item: shoes, quantity: nil)
      ).to_not be_valid
    end

    it 'without a price' do
      expect(
        build(:order, purchase: buy, product_item: shoes, price: nil)
      ).to_not be_valid
    end

    it 'without a product_id' do
      expect(
        build(:order, purchase: buy, product_item: shoes, product_id: nil)
      ).to_not be_valid
    end
  end
end
