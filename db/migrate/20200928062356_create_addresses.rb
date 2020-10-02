class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user                , foreign_key: true
      t.references :prefecture          , foreign_key: true
      t.string :municipalities           , null: false
      t.string :address                 , null: false
      t.string :building                , null: false
      t.integer :phone_number           , null: false         ,unique: true
      t.timestamps
    end
  end
end
