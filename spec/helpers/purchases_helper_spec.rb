require 'rails_helper'

RSpec.describe PurchasesHelper, type: :helper do
  describe 'one_or_many' do
    let(:extra_size) { 1 }
    let(:first_title) { 'first title' }
    let(:second_title) { 'second title' }
    let(:orders) { lambda { |value, title| double(value, :title => title) } }
    let(:two_order) do
      [
        orders['first', first_title],
        orders['second', second_title]
      ]
    end
    let(:one_order) do
      [
        orders['first', first_title]
      ]
    end
    let(:no_order) { [] }

    it 'combines a title with count' do
      expect(one_or_many(two_order)).to eq("#{first_title} and #{extra_size}")
    end

    it 'shows a title' do
      expect(one_or_many(one_order)).to eq(first_title)
    end

    it 'returns nil' do
      expect(one_or_many(no_order)).to eq(nil)
    end
  end

  describe 'render_shipping_status' do
    let(:preparing) { 0 }
    let(:shipping) { 1 }
    let(:complete) { 2 }
    let(:arrive_date) { Date.current }

    it 'combines a title with count' do
      expect(render_shipping_status(0)).to eq('Preparing product')
    end

    it 'combines a title with count' do
      expect(render_shipping_status(1)).to eq('Shipment in progress')
    end

    it 'combines a title with count' do
      expect(render_shipping_status(2, arrive_date)).to eq("Shipment completed on #{arrive_date}")
    end
  end
end
