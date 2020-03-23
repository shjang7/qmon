class Review < ApplicationRecord
  belongs_to :product_item, inverse_of: :reviews
  belongs_to :customer,     inverse_of: :reviews

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :body, :rating, :customer_id, :product_item_id, presence: true
end
