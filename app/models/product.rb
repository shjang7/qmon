class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  has_many :product_items, inverse_of: :product, dependent: :destroy
end
