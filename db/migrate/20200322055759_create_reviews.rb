class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :body,               null: false, default: ""
      t.integer :rating,          default: 0
      t.string :image
      t.belongs_to :product_item, null: false, foreign_key: true
      t.belongs_to :customer,     null: false, foreign_key: true
      t.integer :order_id

      t.timestamps
    end

    add_index :reviews, %i[product_item_id customer_id]
    add_index :reviews, :order_id, unique: true
  end
end
