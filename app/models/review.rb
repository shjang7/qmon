class Review < ApplicationRecord
  belongs_to :order,        inverse_of: :review
  belongs_to :customer,     inverse_of: :reviews

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :body, :rating, :customer_id, :order_id, presence: true
end
