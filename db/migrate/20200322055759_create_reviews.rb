class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :body,           null: false, default: ""
      t.integer :rating,      default: 0
      t.string :image,        null: false, default: ""
      t.belongs_to :product,  null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
