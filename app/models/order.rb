class Order < ApplicationRecord
  belongs_to :product_item, inverse_of: :orders
  belongs_to :purchase,     inverse_of: :orders
  validates :title, :quantity, :price, presence: true
  validates :product_id, :product_item_id, :purchase_id, presence: true
end
