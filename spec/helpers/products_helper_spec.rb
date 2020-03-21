require 'rails_helper'

RSpec.describe ProductsHelper, type: :helper do
  describe 'shipping_fee_choice' do
    it 'returns array' do
      expect(shipping_fee_choice).to be_an_instance_of(Array)
    end
  end

  describe 'category_names' do
    before do
      @health = create(:category, name: 'health')
      @food = create(:category, name: 'food')
    end

    it 'returns category names' do
      expect(category_names).to eq([@health.name, @food.name])
    end
  end
end
