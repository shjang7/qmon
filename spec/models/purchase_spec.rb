require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'has correct informations' do
    it 'with a right factory' do
      jen = create(:customer)
      expect(build(:purchase, customer: jen)).to be_valid
    end
  end
end
