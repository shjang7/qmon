class Order < ApplicationRecord
  belongs_to :product_item, inverse_of: :orders
  belongs_to :purchase,     inverse_of: :orders
end
