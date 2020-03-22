class Review < ApplicationRecord
  belongs_to :product,  inverse_of: :reviews
  belongs_to :customer, inverse_of: :reviews

  validates :body, :rating, :customer_id, :product_id, presence: true
end
