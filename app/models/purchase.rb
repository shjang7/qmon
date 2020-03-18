class Purchase < ApplicationRecord
  belongs_to  :customer,  inverse_of: :purchases
  has_many    :orders,    inverse_of: :purchase, dependent: :destroy
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  validates :purchase_number, :price, :shipping_fee, presence: true
  validates :recipient_name, :recipient_contact, :recipient_address, presence: true
  validates :confirmed, :customer_id, :shipping_status, presence: true
  validates :confirmed, inclusion: { in: [true] }

  class << self
    def unconfirmed_destroy(customer_id)
      where(customer_id: customer_id).where(confirmed: false).destroy_all
    end
  end
end
