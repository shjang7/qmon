class ProductItem < ApplicationRecord
  belongs_to  :product, inverse_of: :product_items
  has_many    :orders,  inverse_of: :product_item, dependent: :destroy

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, :price, :total_amount, :image, presence: true
  default_scope -> { order(updated_at: :asc) }
end
