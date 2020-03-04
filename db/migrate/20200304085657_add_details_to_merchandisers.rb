class AddDetailsToMerchandisers < ActiveRecord::Migration[6.0]
  def change
    change_table :merchandisers do |t|
      t.string  :username,          null: false, default: ''
      t.string  :business_name,     null: false, default: ''
      t.string  :owner_name,        null: false, default: ''
      t.string  :business_number,   null: false, default: ''
      t.string  :contact_number,    null: false, default: ''
      t.string  :company_address,   null: false, default: ''
      t.integer :earnings,          default: 0
    end

    add_index :merchandisers, %i[username business_name], unique: true
  end
end
