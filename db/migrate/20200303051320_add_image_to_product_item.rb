class AddImageToProductItem < ActiveRecord::Migration[6.0]
  def change
    add_column :product_items, :image, :string
  end
end
