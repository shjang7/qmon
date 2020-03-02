class Product < ApplicationRecord
  has_many :product_items, inverse_of: :product, dependent: :destroy
  belongs_to :category, inverse_of: :products

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, :price, :category_id, :shipping_fee, :image, presence: true
end
