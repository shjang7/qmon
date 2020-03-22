class RecentView < ApplicationRecord
  belongs_to :customer,  inverse_of: :recent_views
  belongs_to :product,   inverse_of: :recent_views

  default_scope -> { order(updated_at: :desc) }
  validates :customer_id, :product_id, presence: true
end
