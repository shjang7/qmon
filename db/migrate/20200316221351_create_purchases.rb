class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string    :purchase_number,   null: false, default: ""
      t.integer   :shipping_fee,      null: false, default: 0
      t.string    :recipient_name,    null: false, default: ""
      t.string    :recipient_contact, null: false, default: ""
      t.string    :recipient_address, null: false, default: ""
      t.integer   :shipping_status,   default: 0
      t.integer   :confirm_status,    default: 0
      t.datetime  :arrive_date
      t.belongs_to :customer,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
