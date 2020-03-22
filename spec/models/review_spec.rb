require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'has correct informations' do
    let(:shoes) { create(:product) }
    let(:jen) { create(:customer) }
    let(:sample_review) { create(:review) }

    it 'returns a right factory' do
      expect(sample_review).to be_valid
      expect(build(:review, customer: jen, product: shoes)).to be_valid
    end
  end

  context 'cannot be valid' do
    let(:shoes) { create(:product) }
    let(:jen) { create(:customer) }
    it 'without a customer' do
      expect(
        build(:review, product: shoes)
      ).to_not be_valid
    end

    it 'without a product' do
      expect(
        build(:review, customer: jen)
      ).to_not be_valid
    end

    it 'without a body' do
      expect(
        build(:review, customer: jen, product: shoes, body: '')
      ).to_not be_valid
    end

    it 'without a rating' do
      expect(
        build(:review, customer: jen, product: shoes, rating: '')
      ).to_not be_valid
    end
  end
end
