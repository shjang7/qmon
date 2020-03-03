class ProductItem < ApplicationRecord
  validates :title, :price, :total_amount, presence: true
  belongs_to :product, inverse_of: :product_items
end
