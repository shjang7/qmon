class Review < ApplicationRecord
  belongs_to :order,        inverse_of: :review
  belongs_to :customer,     inverse_of: :reviews

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :body, :rating, :customer_id, :order_id, presence: true

  def product_title
    self.order.product_item.product.title
  end

  def author
    customer.name
  end
end
