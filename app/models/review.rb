class Review < ApplicationRecord
  belongs_to :product,  inverse_of: :reviews
  belongs_to :customer, inverse_of: :reviews
  
  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :body, :rating, :customer_id, :product_id, presence: true
end
