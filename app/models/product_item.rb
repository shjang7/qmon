class ProductItem < ApplicationRecord
  belongs_to :product, inverse_of: :product_items

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, :price, :total_amount, :image, presence: true
end
