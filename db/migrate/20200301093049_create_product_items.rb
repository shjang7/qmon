class CreateProductItems < ActiveRecord::Migration[6.0]
  def change
    create_table :product_items do |t|
      t.string :title
      t.integer :price
      t.integer :total_amount
      t.integer :buy_amount,    :default => 0
      t.belongs_to :product,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
