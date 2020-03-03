class Product < ApplicationRecord
  belongs_to :category, inverse_of: :products
  has_many :product_items, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :product_items, reject_if: :all_blank, allow_destroy: true

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, :price, :category_id, :shipping_fee, :image, presence: true
end
