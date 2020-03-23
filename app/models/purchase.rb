class Purchase < ApplicationRecord
  belongs_to  :customer,  inverse_of: :purchases
  has_many    :orders,    inverse_of: :purchase, dependent: :destroy
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  validates :purchase_number, :shipping_fee, presence: true
  validates :recipient_name, :recipient_contact, :recipient_address, presence: true
  validates :confirm_status, :customer_id, :shipping_status, presence: true
  validates :confirm_status, inclusion: { in: [0, 1, 2] }

  class << self
    def unconfirmed_destroy(customer_id)
      where(customer_id: customer_id).where(confirm_status: 0).destroy_all
    end

    def find_by_id(id)
      where(id: id)
    end
  end

  def price
    orders.sum(&:price)
  end
end
