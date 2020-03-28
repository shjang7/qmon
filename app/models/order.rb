class Order < ApplicationRecord
  belongs_to :product_item,  inverse_of: :orders
  belongs_to :purchase,      inverse_of: :orders
  has_one    :review,        inverse_of: :order,  dependent: :destroy
  validates :quantity, :product_item_id, :purchase_id, presence: true

  def title
    product_item.title
  end

  def price
    product_item.price
  end

  def product_id
    product_item.product_id
  end
end
