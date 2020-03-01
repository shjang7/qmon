class ProductItem < ApplicationRecord
  validates :title, presence: true
  validates :total_amount, presence: true
  validates :buy_amount, presence: true
  validates :price, presence: true
  belongs_to :product, inverse_of: :product_items
end
