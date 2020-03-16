class Purchase < ApplicationRecord
  belongs_to  :customer,  inverse_of: :purchases
  has_many    :orders,    inverse_of: :purchase
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true
end
