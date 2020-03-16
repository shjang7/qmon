class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_number
      t.integer :price,             null: false, default: 0
      t.integer :shipping_fee,      null: false, default: 0
      t.string  :recipient_name,     null: false, default: ""
      t.string  :recipient_contact,  null: false, default: ""
      t.string  :recipient_address,  null: false, default: ""
      t.boolean :confirmed,         default: false
      t.belongs_to :customer,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
