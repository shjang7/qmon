class CreateRecentViews < ActiveRecord::Migration[6.0]
  def change
    create_table :recent_views do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :product,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :recent_views, %i[customer_id product_id], unique: true
  end
end
