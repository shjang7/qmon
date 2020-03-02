class Product < ApplicationRecord
  has_many :product_items, inverse_of: :product, dependent: :destroy

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, :price, :image, presence: true
end
