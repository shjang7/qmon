require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'has correct informations' do
    # it 'with valid attributes' do
    #   jen = Order.new(
    #     title: Faker::Alphanumeric.alphanumeric(number: 6),
    #     quantity: Faker::Number.number(digits: 100),
    #     price: Faker::Number.number(digits: 10000)
    #   )
    # end

    it 'with a right factory' do
      buy = create(:purchase)
      item = create(:product_item)
      expect(build(:order, purchase: buy, product_item: item)).to be_valid
    end
  end
end
