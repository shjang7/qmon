class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity,        default: 0
      t.belongs_to :product_item, null: false, foreign_key: true
      t.belongs_to :purchase,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
