class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.integer :shipping_fee, :default => 0

      t.timestamps
    end
  end
end
