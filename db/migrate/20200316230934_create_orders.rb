class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date    :arrive_date
      t.string  :shipping_status, null: false, default: ""
      t.string  :title,           null: false, default: ""
      t.integer :quantity,        default: 0
      t.integer :price,           default: 0
      t.integer :shipping_fee,    default: 0
      t.text    :item_list,       null: false, default: ""
      t.integer :product_id,      default: 0
      t.belongs_to :product_item, null: false, foreign_key: true
      t.belongs_to :purchase,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
