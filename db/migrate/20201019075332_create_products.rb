class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :brand, null: false
      ##t.references :brand, foreign_key: true, null: true
      t.string :category , null: false, 
      ##t.references :category , null: false, foreign_key: true
      t.integer :product_status, null: false
      t.integer :prefecture_id, null: false
      t.integer :size
      t.integer :shipping_day, null: false 
      t.integer :shipping_type, null: false 
      t.integer :shipping_fee, null: false 
      t.integer :trading_status, null: false
      ##t.references :seller, null: false , foreign_key: { to_table: :users }
      ##t.references :buyer, foreign_key: { to_table: :users }
      t.timestamp :deal_closed_date

      t.timestamps
    end
  end
end
